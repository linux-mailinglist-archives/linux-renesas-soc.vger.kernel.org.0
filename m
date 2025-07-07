Return-Path: <linux-renesas-soc+bounces-19311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 993C1AFB16E
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F4E42092A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 10:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2C5274FD7;
	Mon,  7 Jul 2025 10:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ju6f0mVk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011004.outbound.protection.outlook.com [52.101.125.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9D42877E8;
	Mon,  7 Jul 2025 10:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884874; cv=fail; b=Ba3b3fAuR21nbmGWQnFUmpUPoSXqFQ5ZeOB+2cy9UFR22tuqW9vWJRc/0TX7raYomDQHiaS2RmTRF0B35OK85gGdRAHKnyH8zxYgHN/9s6mDPP5mgU2vLcJfAptzVIYmgAEPdO05EETUoPoUW+bYCQqV2/Yb7SQUuGCSpO/zN4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884874; c=relaxed/simple;
	bh=/UbVWNnYuaHAHn++gdsemUGk1QpGVUvj1x5XectZw6w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nKhmtAPH9zCTDIGopVLg84bMjPUdUPqQqpoJ2iWqVK5E1QB+1wGb3gqoKXmA/GKQyNLuBKuzQJaMDBPzs2lXnfKwrnsMHZIFhzs8z0KtATuCMZfUzGiCEEheQIj2X68iA5GytnpvPs4nQct/9dlazm9i213pwrnbQmQlZsb/HJE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ju6f0mVk; arc=fail smtp.client-ip=52.101.125.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SWGvch+QLdwmf1fq5fJKEizCUA+Vu635SuvdBAZ6pQqyRuBXeE9WDV+G0DNx2Zqds72AFZWsZZ/UR0l+M2yLNsv2n0Wf3AU6xa+C8hRK2SdfhiE0PfcZ7CJzGeL0QdAuqh99CiFjvYu2WockCv195JCPGxkCYge9q3DIdJCqw6yOe1j6A+Z/OzIw9HthB0hZeHQqPYEqwGD4+EHaR4J8a9O7xYx3nQh0mTEVqjLW3jB2YQ1I/SR5GcVXP4OpkJJ/F+wGn/ZMANWs66rs0CggU9Bk9TJQsmKJOLmUgIv5a8DIwZVHOTmL1sOumDRtLVxzHYAh8BbwXErQwsdLh5tROw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d0NCxmUwjK/VKrzYqvadPxo39O739gnxc+cRGsi5Fqw=;
 b=fIGZ5jM99owbm7A/5eZH49/Bnk7UYXrCtOf+HYc2EU1sdoMsXeCk64GvgASZrW11z9QIInnPwTfXVi+2/nR9YCbs5Te1I9S8teF+W+LFjmd8q+zDoof/1bhij+aQbbEeAd0ZiQcR/1QNlQEMe3CyNR515k0LFCqxf7mPTF/5YpI/yvM1CvGRJUteFy4IK1E5l6lcpzSslPELShWnBqVSp3fiErHADPQmg/0s/w9VOgMfNkAX7e86izcvHKDSMGJIktIQWx0NFr66ckczzvVttVAFsRhpXcbyl15IvfQXVP/w7O96BaFHkZadHny+i/RrWB2pzl7+G+2l4kkm1/26Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d0NCxmUwjK/VKrzYqvadPxo39O739gnxc+cRGsi5Fqw=;
 b=ju6f0mVkruXKLl6z5kTqEGD4u15cHXp2mrosEwmjlhoXic7l8K6kuPHGXLBsoOVmM8q3YDZgfpTHjmkQZ1w+Crqb6+H+WA/zEyH9fErrfzwT3H6SvdMguByDquaGwO8SfpOHwFfMfUPBIWSvLIU0c417WhZzSHklPsbzoIiKxwA=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by OS9PR01MB14123.jpnprd01.prod.outlook.com (2603:1096:604:360::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 10:41:06 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%7]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 10:41:06 +0000
From: Michael Dege <michael.dege@renesas.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Paul
 Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikita
 Yushchenko <nikita.yoush@cogentembedded.com>
Subject: RE: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading for
 layer 2 switching
Thread-Topic: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Thread-Index: AQHb7KeykmaFwgLMREu6ovPS4jC8GLQho3eAgATYm2A=
Date: Mon, 7 Jul 2025 10:41:06 +0000
Message-ID:
 <TY4PR01MB14282E8A9E82714106D448EA0824FA@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <9c8cb213-7daf-43bb-8d20-aaefa13127af@lunn.ch>
In-Reply-To: <9c8cb213-7daf-43bb-8d20-aaefa13127af@lunn.ch>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|OS9PR01MB14123:EE_
x-ms-office365-filtering-correlation-id: 1a2ed82d-7f7d-487e-4add-08ddbd42c741
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?r8Y/rythydyH26PebQIsPji6t6N4RXf/cvuU6wzE7KLxzC9PmZ3PrLdbII?=
 =?iso-8859-1?Q?2cr5rRXtMNuTBPCKctiQNnsmRHfmr2fWUro8v5VVPJMc78o41aRN9WER2w?=
 =?iso-8859-1?Q?Ewmm/CJRsOZm0OqJGuBG6KLuqwva3a0LGfCCBumcvTcTk5Pm3nzARJ5Rm2?=
 =?iso-8859-1?Q?OMwEvHzPVJsAh1M8TGPPOXmhxPNRSzrkhpW94SYXqWTPgDabw8ShR4BEkh?=
 =?iso-8859-1?Q?LSllRKS2SBsF6F4cTYcoDvFBSVVuvNNrKXchLgi9orhDmUE19PERbsrKBi?=
 =?iso-8859-1?Q?oq1TlGMYFoRBQnwQeAWpEA8snAvpGVfcRuH+AEQ6VCoCGuBAQ7iHXdMK06?=
 =?iso-8859-1?Q?z6FNPlAx0Hdc3/Lpe9wTPO01PLtVdmadAC5lDxLtlHZnB4SBRFOvyHkSBt?=
 =?iso-8859-1?Q?emw41TwShNBsiDI6Am1VJRP14qklrQfZWw1bVYqqGnimQTItL+AXtQQ3zl?=
 =?iso-8859-1?Q?G4ev+gL1hDxbxQ5YH9cL9oEHoQfd4sUtwX+va/VHU7CJaPAuQrnfKpkqtb?=
 =?iso-8859-1?Q?whz8Hg/biEnO8UwP7MGiFnIXrOU6vzQ7dsrhXo/eYo8kqjCpWwETQxzKFa?=
 =?iso-8859-1?Q?9Cc/ci0hl5qS1ieZ6XBjxPTsO3cTnOCzhpNtkfQzs4KVXimb7rOq9KRXKn?=
 =?iso-8859-1?Q?udfz2GBclMkFK/8iNXVUwg1Ba+mW7gH6aqmu0t5ScodGwXzAC1UdjM3q7n?=
 =?iso-8859-1?Q?+FCR+8mJeSb8spzhn6xVkxRTVxRdxeUsAKq7PMwECc0RgX4T9w5gs2hUbf?=
 =?iso-8859-1?Q?wXtpfY0poIJ7AjvhouzEgQP/5Fp1yfGeM2zGfUJRVBKaX+RtngcbP+ubQ8?=
 =?iso-8859-1?Q?KT3MxHAwGrIngdpqHGOAe/HQwZ2kqvjQORwAo6SxleY7jAJZZpBPiKCAzo?=
 =?iso-8859-1?Q?6FkN2v9oNWV/XN4VzcDqKwkyJYBI//5UPVf+4LqPGVVOgGoLWGHATjdoKg?=
 =?iso-8859-1?Q?qDXO3dzNynde5IGt8dy4c/YLvAiT8FbqD1Sb9Jpf1UBq4+3hsb2NT+0vhJ?=
 =?iso-8859-1?Q?tbiO4qQ2Amr4PPy8xkMwfqFkOZxGCY58DxrK5JocWdnh92EmZL2BntoMBT?=
 =?iso-8859-1?Q?fbmlupi7SGp80KGdxqCQmtNszVX5OJ9ShkVeeAu2aek47B7gux4yoKofBo?=
 =?iso-8859-1?Q?T+Dq4DxEL1qzC9zU7tqmUIFhiiXQM1cXc3EK/IMSdNL0lablrMGeVePnKA?=
 =?iso-8859-1?Q?SOa/NmPeveQ+QBchCsCmRlaFQw8WOFZiEIDiSZm9JsSgd93gkWA2NkMO5Y?=
 =?iso-8859-1?Q?Okrh1YgmC4XM/icKoPlqtKLw8m+J3JW19j1sHQTDYtBtHWbXAdzWB5tbDI?=
 =?iso-8859-1?Q?wisjeQw7tz0QlltL8qsDV7af7nW3Ui2i7IXtvJWO73FR3w8Q9SzJcfEjKh?=
 =?iso-8859-1?Q?v2xgthKvIOFeFGH/mlbh15kkT5kXBBldmAya57VCDvg1uxQUuVUM/Ka8F8?=
 =?iso-8859-1?Q?0vOg2DMT1jIGSCyR5Cli4DT5uFmBSEBEtMQbGXbhueRfCa3tY4woSxwj5/?=
 =?iso-8859-1?Q?UmgxRIR/XY/4ZPu44yTusK2lxNW0Bu1Ji3tjGEMnQpDA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?RdgFDh5+wLiaFNxw386uWQ2kJmIXlXzGOYg1XWhpbj4VDbyY0QJOhOoYgk?=
 =?iso-8859-1?Q?rMeNloWu2z/9v8/tsUx6NaOOl3WCI9eAauiZw8ZNZfCgMlPTYt0fbkto6P?=
 =?iso-8859-1?Q?rfU8tdORCWaLKTApmwWa2sHsDjyNSunBQDmE7jwUjuW6ZzyYDbIuVeemf3?=
 =?iso-8859-1?Q?rmGoiHJOhYcYejZiyTd18RZ3HLh2z9wOCrTnYV+qg2f7LfpbN9O74xtpgN?=
 =?iso-8859-1?Q?xWwf81DxjhNcwQTbU5hKngahifeCgJYy63AzU8fsjnt4isYELrH5+M/GNA?=
 =?iso-8859-1?Q?qrzJJr1Vwe2iM5ITtpaxQ0btSUP55YSCLvH8meLdN7bTGlGl7RNl7Ol+ty?=
 =?iso-8859-1?Q?HHdeXqSEuMaYZ4HShefNbwDIh8AFWvWAo8IniblcD3SLUTuw8DrCDEggGv?=
 =?iso-8859-1?Q?OO/jM/9RYrOcZP1K2UCRCDSQbEV5OQQh/i5vwBvr6SfXeSzw99NKEgft3h?=
 =?iso-8859-1?Q?/IJgc61lkSg+f+GinhDf0bTWBO0TiFg43GHrahXXGgb5sdQYqqsmf1eA1+?=
 =?iso-8859-1?Q?Nd/88WhigL/X2fKakClGsZuPlUYn6FSxhGdBbWmtDKWAff8u2sYCL2FgUW?=
 =?iso-8859-1?Q?dA+FSxDcGl+4qw9YOZIj1tSlf2t+hY6gGuEsbLrGvxE/wmDqERpvElm40t?=
 =?iso-8859-1?Q?gmob0G4S5TI6LKTH/t92MyPfMhIa/boNiuUe1Cni0J/EE9Q7LS6aO5vp7B?=
 =?iso-8859-1?Q?J9Cz9upsnZA6PX5+i/obnuPpLseKjLOfjraNlrePXQnoBjNwcy0Y/m5Ik5?=
 =?iso-8859-1?Q?J5CrjiQmxBhM+OaBICRGiIrLUlqd2Z7FnhTMYJY6exSmBFm18GJeUKu2Cv?=
 =?iso-8859-1?Q?5o6ntJYa3c298qdQKqDtdzJ7Z6c1e/KA+MBGh793otxH+X/seK3Ly1lA41?=
 =?iso-8859-1?Q?6zCY9UdSerew42n+cYxk43OZNcW9+o0Q1PsMJpVdipInuUKB3Od2KSzfaa?=
 =?iso-8859-1?Q?CgETe4/e7twIuSvfuc7vXwMwu7V8EvlZo/t/NIDo2guy0aaCcABHiy74Bv?=
 =?iso-8859-1?Q?TzJ66TeHGGeirzWKOhOXYgojRTG3nX3wI2HRhqNL5uFb218CoNRT98YgIp?=
 =?iso-8859-1?Q?OYg4y0+lQ9IMPoehmLlCN9xk++7rs0npEXRqek1p4T1usu2Ik/4gMZ3UMi?=
 =?iso-8859-1?Q?gpWAOtDjpgxlwZvTKnF1iFRDl0IKvuCSpNUp5hM0f1R/tJ5kkXfwxEGdCH?=
 =?iso-8859-1?Q?9h2YmTFyGEXA/vUsjbrBJ2NoIxze4MJYseEIesHopICdjbTMG6ckfIQKJV?=
 =?iso-8859-1?Q?hhVcc6IhdIlDr8AYACMjR+wAcvXPtZtFBMnFWqF9s6txEkYc0WsZiEt8WP?=
 =?iso-8859-1?Q?ovqKvyYWWfc6OrBDXC6xFXUhTmg5JCLPmk/mlG+AHFq6Wtbo3zq6020QII?=
 =?iso-8859-1?Q?dQYwFid9HsMdmmsVvsgM1bpuO/seEKsJZXh34uLVT3APpVI0BSoImfhBy+?=
 =?iso-8859-1?Q?lKLXU6N0lbEv4pq1/XypQjQ+xfzEJmIabfyBlFGX4oz2vxBpDXEjZL3OTE?=
 =?iso-8859-1?Q?JDCo6g46p1mAGpBN5rtr8pU2q6VdDOYZ9/4POlUaVDph6haLD3YyxeRIVh?=
 =?iso-8859-1?Q?4zbsqnmdGvF2QwCSkB6hbNcUUlR8bqZdbocaLimnj3hyVrn1muHRv3Ig6x?=
 =?iso-8859-1?Q?l5u9XrKvSoFrYOoRO4MwNeus6JWrsx0EKT?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2ed82d-7f7d-487e-4add-08ddbd42c741
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2025 10:41:06.4373
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y2qJL1rLwsp1r4sG00sW8urmsFsvbX0ss1GSxCkhQqF6BgpOa7iXWFK2vZn+NQuK3tEcR7lFzwFWTJKXqbrESD0KBrUcGk40drwxyYSmec0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB14123

Hello Andrew,

> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Friday, July 4, 2025 10:34 AM
> To: Michael Dege <michael.dege@renesas.com>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>; Niklas S=F6derl=
und
> <niklas.soderlund@ragnatech.se>; Paul Barker <paul@pbarker.dev>; Andrew L=
unn <andrew+netdev@lunn.ch>;
> David S. Miller <davem@davemloft.net>; Eric Dumazet <edumazet@google.com>=
; Jakub Kicinski
> <kuba@kernel.org>; Paolo Abeni <pabeni@redhat.com>; netdev@vger.kernel.or=
g; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org; Nikita Yushchenko <nik=
ita.yoush@cogentembedded.com>
> Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloadin=
g for layer 2 switching
>
> On Fri, Jul 04, 2025 at 07:51:14AM +0200, Michael Dege wrote:
> > Hello!
> >
> > The current R-Car S4 rswitch driver only supports port based fowarding.
> > This patch set adds HW offloading for L2 switching/bridgeing. The
> > driver hooks into switchdev.
> >
> > 1. Rename the base driver file to keep the driver name (rswitch.ko)
> >
> > 2. Add the L2 driver extension in a separate file. The HW offloading
> > is automatically configured when a port is added to the bridge device.
> >
> > Ussage example:
> > ip link add name br type bridge
> > ip link set dev tsn0 master br
> > ip link set dev tsn1 master br
> > ip link set dev br up
> > ip link set dev tsn0 up
> > ip link set dev tsn1 up
>
> It is not wrong, but it is normal for an interface to have a number of so=
me sort. So br0.
>
> >
> > Layer 2 traffic is now fowarded by HW from port TSN0 to port TSN1.
> >
> > 3. Provides the functionality to set the MAC table ageing time in the
> > Rswitch.
> >
> > Usage example:
> > brctl setageing br 300
>
> brctl is deprecated. iproute2 has a method to do this, which would be a b=
etter reference to give.

There is a discrepancy between the value being passed by iproute2 and brctl=
. Iproute2 passes the
value unaltered in seconds and brctl passes the value in seconds multiplied=
 by 100. So far this
is OK because brctl is deprecated. But the default value being passed when =
neither brctl is called
nor the ageing parameter is added when the bridge is created is also multip=
lied by 100 resulting in
30000s being set as default ageing time instead of 300s. Is this a known is=
sue?

Best regards,

Michael

>
>   Andrew
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.

