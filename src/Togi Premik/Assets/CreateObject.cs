using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class CreateObject : MonoBehaviour
{
	GameObject go;
	public InputField[] fields;

	// Use this for initialization
	void Start()
	{
		go = new GameObject();
		go.AddComponent<LineRenderer>();
		go.SetActive(false);
	}

	// Update is called once per frame
	void Update()
	{
	}

	public void Create()
	{
		go.SetActive(true);
		LineRenderer lr = go.GetComponent<LineRenderer>();
		lr.SetWidth(0.1f, 0.1f);
		lr.SetVertexCount(fields.Length / 3);
		for (int i = 0; i < fields.Length; i += 3)
		{
			lr.SetPosition(i / 3, new Vector3(float.Parse(fields[i].text), float.Parse(fields[i + 1].text), float.Parse(fields[i + 2].text)));
			//lr.SetPosition(i / 3, new Vector3(Random.Range(-5, 5), Random.Range(-5, 5), Random.Range(-5, 5)));
		}
	}
}