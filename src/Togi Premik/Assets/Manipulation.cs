using System.Collections;
using UnityEngine;
using UnityEngine.UI;

public class Manipulation : MonoBehaviour
{
	public Transform[] points;
	public Text Display1;
	public Text Display2;
	// Use this for initialization
	void Start()
	{
		string txt = "";
		foreach (Transform t in points)
		{
			txt = string.Format("{0}{1}\n", txt, t.position.ToString());
		}
		Display1.text = txt;
	}

	// Update is called once per frame
	void Update()
	{
	}

	public void UpdatePosition()
	{
		string txt = "";
		foreach (Transform t in points)
		{
			txt = string.Format("{0}{1}\n", txt, t.position.ToString());
		}
		Display2.text = txt;
	}

	public void ResetPosition()
	{
		transform.rotation = Quaternion.identity;
		transform.position = Vector3.zero;
		transform.localScale = Vector3.one;
	}
}