Return-Path: <linux-renesas-soc+bounces-27366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WNTiLMWpc2nOxwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27366-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 18:03:01 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1184878BFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 18:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1CA7301E94F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 17:02:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46191274B23;
	Fri, 23 Jan 2026 17:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BCD9159W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011061.outbound.protection.outlook.com [40.107.74.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148FF22D4C3;
	Fri, 23 Jan 2026 17:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769187779; cv=fail; b=ZwNvZwPrKyTtEYrAXN+zPl4NVNAkb3aL7m0Yi0mqz+U2Tv3BvRP6WGHLADAkEOrrXzU+eXWhxsHGTn7kMGRlWO09b863/81RDt//RLyRaiNSfrDL0CxdfoAEnrsprPdqiG9GcbmJg/F6aP6wdOccFvnLw8A41wheRWQrVt9aQkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769187779; c=relaxed/simple;
	bh=/iM47cleuE3as18zC3qn43g8JdqmjL5LzKHcEgbqAfg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bVEzlTdxrgQb+VLHC7/3f23u10SGOjvtiur4EJaWZK5xntAthrpLNg6yMNcVRr+Sw6eaIDrazUHHU57igO1EJfC6hG4++ZtCXfRwMpVJuWiAxLngB7Jp4RHpTl+j6vOoS27jhiYFh5xXfqpFJrmICSZesAoebw0FPa3JmZqIZ/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BCD9159W; arc=fail smtp.client-ip=40.107.74.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd8B293VADOraa7IgHKpFFMv+yhTsXaCP94l3JyGBEsQyhY+9fvyp0dyrQcO6jVkRM1WZ9V9pzryII6aejHU/x3CQKMJWuObKfxKm2AcycOpT9dkcrVWY+0B+KGFyjJcHXZIIzld3r13C6rMPf8Rnjgq/JHhRwOe2lhn56a8VluGGHsgoiZuTTOOeza9sA3L4DOUmdeoeuQ5Mpavp8K96nZHhGvSz8/oh+H4xj759l3vI4rp5ZylvKq2SvNsVyrQG2tsg03QqDR4sIP2PRP5BXywLuLnpRF2qB0gvi3ZXzC5fwhHKzbMvnTaa1c2bx4Z8RET8MShoXQYFVRVJPv93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1k8bB9w9beEza3DDGhXqBgE4CqAiTVMSARY9Tb97GKY=;
 b=mlopYjVINFJF/IW1hJACHKSqoxsCBdAsOU9xjBruCAkWPu0v50JJpPMk6tQkZv0RalDGvRa1yISzapOXxlrLs7VF7RCO1EWx8BtLct9FxKalzutDSrCmqYYjRWA/E2S/Mm1uZIT4vuVs4M9V7tIba/v4sRYbNOxTzClChXGMNA+vhMrCaw5s7bglkBYOEiLxX/EgQw1EHxuP1IzEVsOLTGW8hpJt/q8uqyhBMyUimXaRiZrMXtp7kkSke639DpfyFeWGTVm/0uGFGRnV9tKWfm4eT03MoggnzbPbafeLp2ef53K4kl3WW+GZZnKNJTD2AMWbR0iFj/U5HLBU9OTcHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1k8bB9w9beEza3DDGhXqBgE4CqAiTVMSARY9Tb97GKY=;
 b=BCD9159WEBy4tGLD2hw04yynqhV/1b2xlhiN8ekwUFG5aApZSAd0du+pcFgKKU+jyZ+S31o9oSNdv/8hv69BzuYs4ZTYzqPM4UZ7XrljvOq8hN3clU+/tbBN76vlVDOuhQHqfI1VZYTIrMfh3U7SSWtIqzQQAc31ziTDK/0nGAQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB12381.jpnprd01.prod.outlook.com (2603:1096:405:106::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 17:02:53 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 17:02:53 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Topic: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 PCIe
Thread-Index: AQHcjHDzR9FqpLlwnk+/IlAqDba/yLVfzV5wgAArv4CAAAFHkA==
Date: Fri, 23 Jan 2026 17:02:53 +0000
Message-ID:
 <TY3PR01MB1134660CF3A2E6CD38D5D3ABB8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com>
 <20260123140031.94752-16-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346C8FD2A15580D4FAF501D8694A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB17377B4702113638C127F2015FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY6PR01MB17377B4702113638C127F2015FF94A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB12381:EE_
x-ms-office365-filtering-correlation-id: 9507da05-ef4e-4b1b-1f87-08de5aa13f50
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?/iWwbo0IUsCAMM177J0aNxG22aGZWNh1X4U/coQ+2Ex5/YzlhHCB3EoyLUDJ?=
 =?us-ascii?Q?5+KekpHO/7PWUWiBfiQclE6JR4K8GvumRPrFNNejE+kybVGPb3FD12MYSE2x?=
 =?us-ascii?Q?diKA/TfqZjdq203gZ6d4UX7EtuW9y8+L3fkbyOGlzUg5Adqyxz6fQGHEuY+i?=
 =?us-ascii?Q?cUvHeBN3fPwQP3UDWW0GbFL8q6gc4oMe/ADqQgGK+RhSDnhMut5WAplLzuXk?=
 =?us-ascii?Q?qu+YalOn0xTBxlK7UsIeQtXdxFEL8oNg6iVvmLIVEpDbVOQEkehfL8kWutWK?=
 =?us-ascii?Q?ljJgy5kTgesNN8OX4MMuyqMYi9MYFXfdsKIM+n23+lr6K445HYbX+Qx19NYZ?=
 =?us-ascii?Q?gkAsv9/LGbtZBFmnHky+L5BL1FufqJjXi007XJgNCJWv5EaPocMGOFdpdQzQ?=
 =?us-ascii?Q?YcnQcJa3aYwqW1fxogWP56dlw6L7GKmO0nSLlf+sFsCq8yAbsjJoiKg8YmGi?=
 =?us-ascii?Q?lRfFSbnntKdajW8EIBUvQpxahhFfWJV23gbibAsCkIrdmzHoo9wsxCsBZuTe?=
 =?us-ascii?Q?kTQQGGN8EoCkddoFMHzUc0gIlxEEVYngRu0qJ1XObW6c52pXFBhtNx491hft?=
 =?us-ascii?Q?o6oBEqBMgBXwNZfr/AMCr8nQFNk2oh4WYHK4RvxXTNV2V6evvYfj4tG1bsIv?=
 =?us-ascii?Q?KbfO2BbRZ8VBBEKWkytrrrTLbfVvzzvRPYgPww7w66hW3A7Dky1faVVPZKx6?=
 =?us-ascii?Q?aIfmEOxz2bVbBTqrE2seFuBiZFT4xqFIg6Su+pVX1E3O5SljxeGHR+h5cemN?=
 =?us-ascii?Q?GN0EmJ/ZTI5eOLW4PmDFf0wRy9Bp3yuKr7jZ8e5lXWFM3winkfvOZzMZ3/Up?=
 =?us-ascii?Q?4LdMy36QMzMmKWNT38KQG05W/ShHormmUiJMUdI5MaJx/yM76CpiV2oGnIhA?=
 =?us-ascii?Q?M4o9h1x39oeK0e4h2kVcf6/efUYpXM8VhiClUKA8A4iWiSeIcQkc60Xqde8H?=
 =?us-ascii?Q?H3lan6nnkK9VzomKT/bKSbtuCNmL3aWb+LdWwxD9zHGCuu5M1tG2FkxU3pBT?=
 =?us-ascii?Q?crQ6Q5HaoQIDJrxLXY+XiI2Hmb1SIEsdNL8ITZ2v7ZHUCgWjHx9xHPiv/b11?=
 =?us-ascii?Q?r653z55KbYIdHHjitkMs0J+u+SaT5iKyO0kTAPkbf0gNH1geh1xDCaRmt+/K?=
 =?us-ascii?Q?HhrvGFUnOWzf/Y0QN+JL4OpwlHxlwjvSjJwtnlJaZswHIeP+uYPTOi/tOhwT?=
 =?us-ascii?Q?Fa09uhfiILWZ24a/YiGvwmgNOszEE/0LsDdhtV2Khmc8O79Obp71/m81NCl3?=
 =?us-ascii?Q?qYg1lI1O4HNApgrHoj5U5X2PgusEm7qTEFbrls6Othab/qAJXtVhS/h7pIQy?=
 =?us-ascii?Q?/L3/g0KqcrL/ozEK9cdMZU7ZohtmJlBKS2jzQ/vG9yn0Al1hPPo0twqQBPwM?=
 =?us-ascii?Q?dT7bFxeh1r+oQ9jKtTxkbWuddegUwfQ9wZa785GfMJS0WPRZU8nZQGq/8J09?=
 =?us-ascii?Q?wHZhK+zk+8dBoVWyjh+GZVlVhTgcuxAOxTT0yA8wqWDFAoWNc/eqR5nctxJt?=
 =?us-ascii?Q?+wlifyHLwZhuhyFNX40uT0lI9n/9XJxUVykoRlKGBd/fnDyEGkF2C3nJCS2Z?=
 =?us-ascii?Q?GyQtL4fD6wWgDn/CgNUgXieSzpQ3VoKd9vHpO4+RmQmLyYQ/F5LnfcEWcV9A?=
 =?us-ascii?Q?sxXIvbSBo4bJMJLKns4dBzzBOzDbuJpnWHPr0dZNx6xA?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FC6564KsOvi3Uz5G/4nT6+g2J6FgavdXOBA218VYlazHccqltQyxsZRtycSy?=
 =?us-ascii?Q?Q2LbMACmL1wV2Ocd9G7OfipYB4eUoS1fIDHz9RBTgzajvfmkY7tiRqUwbRA7?=
 =?us-ascii?Q?INBDiKlj/CZBjsNuEHmBaRdnCJOfrdQNmCGuCOyrbnRZKryRd0vkD0i8bq6E?=
 =?us-ascii?Q?zFQgBObIqKqhWK/ktC3VRHMKqsU3K/IFK3NgEEaLwnl56nXxAvimT3JcHfnS?=
 =?us-ascii?Q?gDF3vP99inRkHWkxUaTraHHJTXKeN5nK+/NbQoITjC1JfQTrIiSBX7GngfO2?=
 =?us-ascii?Q?04o4LGZnDScJKuMKGtgkrYgV7m4Mq6lvYoOcGFEvcn5eZeYUN9XcqT5rgt+W?=
 =?us-ascii?Q?mbOwQYq2Vgie2o2g5J88zlaaXCyIwuYSE2MUxY/BQfMq9VxjpVwsjXPTleKv?=
 =?us-ascii?Q?+fbKgqhpccR+tURIn/rcPCVmIg8RLV0pjUsWwQGP2RNuJMk7Zc+UT/pntd9t?=
 =?us-ascii?Q?cqqB3BBdt30uOPzTMRZelH+8WvlrqbHNR+CUDGXxiEZ73yGlHbHuQNLg/etF?=
 =?us-ascii?Q?LaP2urHWnERA4ZRYRkzJGEdRfNLE1XvYm38oXPY5yH7uG2OXww5V0wNdwP4f?=
 =?us-ascii?Q?DHKFTQXpdlEA3SM28lTbtjRc+FX/XgfMyOGLqeZVrfHToIdlS2gvQ+WjHoTv?=
 =?us-ascii?Q?GfauqDDw8FlZqPJWEC1NRf+f4edFm/vMtXbkVjZXZCbrKly47CrNmSziJTEL?=
 =?us-ascii?Q?59AT+/HyNpdyqTAarI8LF8zlwDzJJeqWxKRQ3iP0a5TmqlgPEj15eUQewmBr?=
 =?us-ascii?Q?jPrHMwoHGpLoWfvKC07BAGEa70xEJJSF40d98HQYchxF47hTabExsa1PKUzZ?=
 =?us-ascii?Q?Fg/lfdpQaQ64qOr/ubaE5CS66s7J+pzaGWeZgfQk514QPE/fzJL6CsoBDUmZ?=
 =?us-ascii?Q?9/inXFPwVBcinJYJ5CesJYYtnUiWSsC/gTL2BbG3Z2ceiyk2Z+e8IF6BsJx0?=
 =?us-ascii?Q?VEYkYSCipgwEj8xBrXTmg7z9M0IWtgW1BPCdmHLAGAPphKRJ65qWggtvwGdn?=
 =?us-ascii?Q?MNsVg8gpgNUU176gKogZ6vQKnrQs/UaccGkb1hQSvFTT2t7ci8jn+V1WJ3b+?=
 =?us-ascii?Q?dmCWtN8Fb4dIOC4InHO2ODS8EkNxt3aDKYTYOWMZ31gyJvdiNYnkcPJZMD1f?=
 =?us-ascii?Q?OKipNvdXIgKVuviPv2h0TbA7+ZN9ez3P4r9WwuMYuT4iCG6KCZy9tkJPhCfJ?=
 =?us-ascii?Q?RWRrDgvlKD1DFRB5j2cvHU6o6Snq6T9JL+wdJfyFgMVGb/TmPsDcbgpJpYgq?=
 =?us-ascii?Q?8KRPyFgFkiEBxXtg86ddqeqgtvy1ChaZNZg8vBt4Qo37mjxTIGM9c8WfUem6?=
 =?us-ascii?Q?s0N4Zku9mMp53ZHIxoO9/E5IICV5kXK3imN0A4FMDD9VR5hgt0MOcpj7MLYA?=
 =?us-ascii?Q?WrbfSG7rdBorQg3XbCcCTaJQnbWot1uYQk+zOzbT10dEnSwCTSu3AmPRZXiv?=
 =?us-ascii?Q?zEuv3cXzVJNGF1MwRYrWIS+sp9kYNtPTA2VnwgL7Tzb/bYIvvru0cXCiTbPw?=
 =?us-ascii?Q?1HOciZWx+OxPO3IEDF5yHL0eRRt2kyodrj0aLj87ICGEfFe94TfpqUWEQEBk?=
 =?us-ascii?Q?S7fKRVhGhne/Yf6JoeP9VjhOIGkyDrteWDWgCRbxNcfMKB71eiei2QV1SdK8?=
 =?us-ascii?Q?17vLIdultZe3+pN1K6PL/mYPZZazEv9RAvv7UlEoBiCgDgr4RGgSnJ3buDhO?=
 =?us-ascii?Q?W6WckO+QEkbeCAXnWwEzNws2WVZXQZtgBhUeMoRPDuQE9vWDsPPxrO//+aid?=
 =?us-ascii?Q?EtCIWraL2Q=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9507da05-ef4e-4b1b-1f87-08de5aa13f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2026 17:02:53.1423
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: waPwF8HnPExy/D/6V1XRdWio2CE13uWwb7i5R099ZCZukbnNe6h2xZNaW7hBmKWjVNcR3EtbOELAHdxkK1unJgDL7QKns4qeUJtJrjYTn20=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12381
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27366-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.988];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 1184878BFA
X-Rspamd-Action: no action



> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 23 January 2026 16:55
> To: Biju Das <biju.das.jz@bp.renesas.com>; Claudiu Beznea <claudiu.beznea=
.uj@bp.renesas.com>;
> lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org; geert+ren=
esas@glider.be;
> krzk+dt@kernel.org
> Cc: robh@kernel.org; bhelgaas@google.com; conor+dt@kernel.org; magnus.dam=
m <magnus.damm@gmail.com>;
> linux-pci@vger.kernel.org; linux-renesas-soc@vger.kernel.org; devicetree@=
vger.kernel.org; linux-
> clk@vger.kernel.org; john.madieu@gmail.com
> Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc: En=
able PCIe
>=20
> Hi Biju,
>=20
> Thanks for your review.
>=20
> > -----Original Message-----
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> > Sent: Friday, January 23, 2026 3:21 PM
> > To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> > <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> > krzk+dt@kernel.org
> > Subject: RE: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> > Enable PCIe
> >
> >
> > Hi John,
> >
> > Thanks for the patch.
> >
> > > -----Original Message-----
> > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > Sent: 23 January 2026 14:01
> > > Subject: [PATCH v2 15/15] arm64: dts: renesas: r9a09g047e57-smarc:
> > Enable PCIe
> > >
> > > The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> > > Enable PCIe support.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > > ---
> > >
> > > Changes:
> > >
> > > v2:
> > >  - Removed board-specific dma-ranges.
> > >  - Merged enablement and pinmux assignment in same file
> > >
> > >  .../boot/dts/renesas/r9a09g047e57-smarc.dts     | 17 +++++++++++++++=
++
> > >  1 file changed, 17 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > index 696903dc7a63..6ec34e7565bc 100644
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> > > @@ -122,6 +122,12 @@ key-sleep {
> > >  #endif
> > >  };
> > >
> > > +&pcie {
> > > +	pinctrl-0 =3D <&pcie_pins>;
> > > +	pinctrl-names =3D "default";
> > > +	status =3D "okay";
> > > +};
> >
> > PCIe slot present on SMARC2 carrier board and the entry is missing in
> > renesas-smarc2.dtsi
> >
> Can you please elaborate a bot more on this ?

See the contents of the file [1] and [2]

Common carrier dtsi for RZ/G3E,RZ/G3L and in future RZ/G3S:
&pcie {
	status =3D "okay";
}

Board dts for RZ/G3E:

&pcie {
	pinctrl-0 =3D <&pcie_pins>;
	pinctrl-names =3D "default";
};

[1] https://elixir.bootlin.com/linux/v6.19-rc5/source/arch/arm64/boot/dts/r=
enesas/renesas-smarc2.dtsi

[2] https://elixir.bootlin.com/linux/v6.19-rc5/source/arch/arm64/boot/dts/r=
enesas/r9a09g047e57-smarc.dts

>=20
> Regards,
> John
>=20
> > Cheers,
> > Biju
> >
> > > +
> > >  &pinctrl {
> > >  	canfd_pins: canfd {
> > >  		can1_pins: can1 {
> > > @@ -167,6 +173,17 @@ rsci9_pins: rsci9 {
> > >  		bias-pull-up;
> > >  	};
> > >
> > > +	pcie-clkreq-n {
> > > +		gpio-hog;
> > > +		gpios =3D <RZG3E_GPIO(4, 5) GPIO_ACTIVE_HIGH>;
> > > +		output-low;
> > > +		line-name =3D "pcie_clkreq_n";
> > > +	};
> > > +
> > > +	pcie_pins: pcie {
> > > +		pinmux =3D <RZG3E_PORT_PINMUX(G, 7, 1)>; /* PCIE_RST_OUT# */
> > > +	};
> > > +
> > >  	scif_pins: scif {
> > >  		pins =3D "SCIF_TXD", "SCIF_RXD";
> > >  		renesas,output-impedance =3D <1>;
> > > --
> > > 2.25.1


