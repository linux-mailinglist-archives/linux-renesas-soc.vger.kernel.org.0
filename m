Return-Path: <linux-renesas-soc+bounces-33092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOYsC+AuFGpgKgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33092-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9105C9C9F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 13:13:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EB5B6304891C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 May 2026 11:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C5437F00B;
	Mon, 25 May 2026 11:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZGXZxxRX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010034.outbound.protection.outlook.com [52.101.229.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3856C25B085;
	Mon, 25 May 2026 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779707256; cv=fail; b=jzSe+H1yGEhC1Hch8cSZ3GMHv6DNH0D3PmHs+eLZcDjcXbYQVODjq4SnPMugFZl5E3JBsluLMCk99ITf+oT5/QMNmgVndv/SYJPZErm6f3+O0u2UbOnowKnWUS/eA/idwBkCT+XsTq8qbj5+TraqmKAxaFXXz/36+BfkzD+8UWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779707256; c=relaxed/simple;
	bh=/RTFEMGXe6LnX+nWIhW4yGCFAWNxyuWNfKZILAoA3Ns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HQRbMKtXiiw0nvwLj98czF/fnLvN1ZddTJ8i+43N0Mah2QiAhW7KDvQ/djRFT41AqyszZzMlEX9xLYUge6RYGr6s/bJpZ22oAM2BKnEwn5dB+hHxxtjXhFv0lGBqE1yKkLnsnglAre0UfO3D/lPdn3AWS+WObUG395qxEv+AkeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ZGXZxxRX; arc=fail smtp.client-ip=52.101.229.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jl7ZYABbi5ywIhnakVxTkm4dbljiyAMqmSKX3s7BBFoascLgZ+dD6q5JMSDGje5792Dfk4PwcWdvXBdE5BTeVaoIcBE/uMq5CdVkWemjXNdaa/15F1xHYZiUSa2M11Qxx4A0MWTITUHPkf6v6GnZhXwCWwqS2h3EduWuaUq3koIkWQnQf8GcMzqeyRspJUxWxMKbVODN9gb65Kl9GW4wtrcA+qWn7RyXB8dfko9It4LGexndswpIHAWxzmNEcHbTsr4C62P2Ig/iq1ND4BtVtcIQarr3yW08f9frgml5Kmt906qhqcMUFtZ1LOSzJisEnTkBhJnPn1y2bcUPs6pqCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8+PQlM3t2pQgVv9QbkWt2s1Atd2xMtz+cU3/0VzYLo=;
 b=RNakqvMMDE1vDE5tYayq3tIKrgs4GTgPuROkdsVHkIL1Dp2q4+RBaiEN78FZ3DUUdNM/XLLo23WfrixAUoQ4xRD+lZLJf/Z2c2nkcvI7UzIDbQeVIRgvCy5GP5EhtHGoBJYU8cc2NUvsrzKKBOVLerUGTLxRwIC2ZIwXK+590r9wmu/HEKbnfJ2bDQr6s3BmcgwP0n6ZhRP4AIIkEWWhbEuP2XWu/30SWoiX7ByJCtVxerkU+Cm1QcV3tULMIcQhiZyqvEXkIMDvQTsfM0E1lmKK34/3l7uG0thPv+ZMGGMIb1nOHGoNJGLG8lO4Sr67eIyezGNMdm3PUjoHQQvuww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8+PQlM3t2pQgVv9QbkWt2s1Atd2xMtz+cU3/0VzYLo=;
 b=ZGXZxxRXH/blV8Dbl5wtBVrBbh3dxa/VON53AT2R8DU5/qjY1AYKnH90uyGBc1ou4+Cu5NjpZrSbln0Whm6sAcESnxgjHbEHWNcQ7clYVV9M9YXIq3AxESKBA8B9qMU4QBCKcLZHx/79BUin6uAvcXipG1t6zZrxNYnA0inbnBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OSZPR01MB8484.jpnprd01.prod.outlook.com (2603:1096:604:189::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.19; Mon, 25 May
 2026 11:07:32 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%6]) with mapi id 15.21.0048.016; Mon, 25 May 2026
 11:07:32 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: bmasney@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	john.madieu@gmail.com,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v4 6/8] arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
Date: Mon, 25 May 2026 11:06:01 +0000
Message-Id: <20260525110603.4018170-7-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
References: <20260525110603.4018170-1-john.madieu.xa@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0037.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cb::11) To TY6PR01MB17377.jpnprd01.prod.outlook.com
 (2603:1096:405:35b::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY6PR01MB17377:EE_|OSZPR01MB8484:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fac707d-6b02-4508-9543-08deba4dd17d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|11063799006|6133799003|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	w+q/na26jkeJ+PPIy6ihj3ZOvveOvg5gwPwH3tnH1HJIQSluhZTpffu1fQpUK72A0iaonIcvcxclNacvEUMw/rnpihsNcXfpiS7QAYs6ziYubsp5RRtRB+/ZYLkz+RWF2T05oXsEm9kP1vp6U1i7FhZcHqyTvQfzPQNyrj9j0VUJHmT5jklE85sCr1vu+dK/OkxGwKuaGT/6fESliaJpBGYQIdYjGDUXhOzsHJgTBLaduy7BDgpNDTmC7PghHrTr7FXXGRAUQW7lhzh+/MpMSB5FezIx7jfQqnIr3zY7qRrX2YoTKxdfNolFFvsWOgPSNsnl/w3DMANyZoJJXMebjmY2MJ2bmvYdP1aRDwbw3QglCoj+wjfSim5MvjVicERJ766quJZ6TLbotizsl52aa3wK074oeneTqQUoZjHK/rdMsCy88JN8yltwgRK4pugAldcPLwzKJeb+SRCphahnuPEe8Qv69H384I9Sm7OQbPooAgGOy0rTp0QPIHT/TF3KaQTBHWj5PZouyw1zqyiX6HooMf6uJYowV7G8F2g3X3mVNzoauCV5VGtfvn2m6jJOaTibRbJLvrzgMgjMMqlZOteTZxT0atDctYQBfgYJ2uHtzFB/ZEnvNuNHS3VXssJwOesWu2y+Bc9O9ghvtBP/oxqHN7Af/uTYGEi+TxEgoITkCKQaOe9fUtNa3rdIGSFFZGTTpGtTuTs4MD7rh5lvzPdMPXmamDwtP2c/KDFoixhkLLFl7TGYxiDyVyETx7UO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(11063799006)(6133799003)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GzMTZaTtrK80M8IrzKWATG/jmTIbVWNn4yHR1x2sMEzueKDEG9cLioEclCU?=
 =?us-ascii?Q?NdtXWRZguvW6d6dH3gOlBFLngcyXcecXd90RTPGuquB6xZG3wpSCpQlmQ3zT?=
 =?us-ascii?Q?P0SfCMMH6ryZReLblcEBG6Icdam4zYFWObcpPMK6Prk8Z5HsOZtULIirMg/L?=
 =?us-ascii?Q?Ay7Vm2D2tl9BwoBW9opVk9gwYwVcsoJ4nR7aNMsHF5yxoXzgA63ratRV+ga9?=
 =?us-ascii?Q?fdJZV67ufrNmzpdjiMfsW0gU+Y48fI5SbJgUfzAId7eMjRBw/LeTEWEhIaBo?=
 =?us-ascii?Q?Qv0K788zQ4jPV4f+AwjVxvkSLiUeJoa58qk4v4PfIAxqXK/N+nC830HhibKB?=
 =?us-ascii?Q?k+++NCAq83poyQJ0rt+ZOZjE3gFnqgq0Xnr3mtdU1Vwj7RLHWDkKihF3zH7O?=
 =?us-ascii?Q?WrikRpZnyy6zSoT23VhXfW5rUXdkaN/d9OVlqRnb3xepfXEi9dDKzbblZ/p2?=
 =?us-ascii?Q?7UP6TY+dMSpuegA7Hp3/zqm154woy7mfR73HMg/Q6cTitJSi0MGrwarXeGCz?=
 =?us-ascii?Q?uW3GIfITFii/kB4pJdcLtyiasOj29g4b4Hhah2AtaWrY9U8nAL+sNpHGPMFL?=
 =?us-ascii?Q?VKA4abMtn/+etuMoFp9wtm/vLivmq/gUty4+QOC8m+6F1pZNTxxNi9iHAoJ4?=
 =?us-ascii?Q?glGDEQE0YCl7amprocqox1Ca056R+6PWI0oFxnNnOWHFH+AzXQ+w5Hf+YBgj?=
 =?us-ascii?Q?se+29rH9yuKVHhD7dDBH2esM2Z192+QQd/QbOIO+JJSI1Cyl0VvF/0Er+U/K?=
 =?us-ascii?Q?hnnZDoCHw4ik+5Loq7olT65Qt7Yxrl9mxmsNxAiOfrztT1kZ+gnR7Bdp8Fhe?=
 =?us-ascii?Q?HbwWSYwIHc6Pr9dyIyPYmGvuWu5morWmwsmb9KqPM4eHHq8BZT495oBHLMn5?=
 =?us-ascii?Q?4MFM4UQ+FGTt0Gh28i20tbydpTAZVz//9E2Lc9wzcaW4mypPeGMfDM+mrryU?=
 =?us-ascii?Q?PQWca+T5tHluGt5oiEODqmGV9b62jkcUZhruonq/NIKPkJkNu7jf5EtwRFzR?=
 =?us-ascii?Q?M0abgTb5TT+V9A17Ab2rJ31n4GpD2N4YAYqHxi6K+eGTnbngJibaJTUv/Ia1?=
 =?us-ascii?Q?uBkmO0+YamrFHbgywnd3qVQ15bpC7MVyk9thk7/uleJ85XD2JWRkl3CKhVCd?=
 =?us-ascii?Q?juZuW7tx9r+0NV5JzexvIrUTj9DrfBjN+ZehoAQsjlZIIvXTl3SRReXuX0fp?=
 =?us-ascii?Q?pzjmSbcCDvogHfxjDgCqHGDegQ2Xup7TwxjWOrwZCCBQf67AbjRyZNB4Kd/N?=
 =?us-ascii?Q?C4nBnv1cx1O6H2bn4zgnFONiTV8jFXwpgVT8u7qoAjvOcqPRoglcvuxhGstT?=
 =?us-ascii?Q?t6XlhM3FnVb3dEa9/AqnypIRuILDd94xRUeVTGTW7HbAjOvNoM8D4WA9eWLt?=
 =?us-ascii?Q?Xa9FfC9ov6eFXbSJ2xxn8FvLLZIJAbxii02ScunzdRf6qwm/n6ewvPrc5H9H?=
 =?us-ascii?Q?4IMSFTW3XD3RwNBLUqsPdWC5nTKovdk23gJOAYgC8Ja8fpJaL9OR6apQX055?=
 =?us-ascii?Q?NAlwZyCUqNQAx+AylZUWdaDL4j30Z5vGtNnQ/mw6mKjUif5BNtcP5X8Bfsg3?=
 =?us-ascii?Q?MayNp3GZBvlPxOewLwEHEOD/CUaF3oJKeVGWQAUYQsaUnGGfKrEL5EYMnWq4?=
 =?us-ascii?Q?wdyl4Q/JLv7eFEKz7z6DKL3HWVgobQXWo2czp2KTgrZrWdBsHZ8SB3pwFae0?=
 =?us-ascii?Q?bt1k7b5NBUZpti/jE40V+y7Vb+DXoFzV8M8APzk+DyTFP6xghNQreO/AE/qo?=
 =?us-ascii?Q?777WeelvSoi5MQoggliwLLpJLmtkvt4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fac707d-6b02-4508-9543-08deba4dd17d
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 11:07:32.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo4/7YamJVKgP9cdULKxGzE8NQOq2gmKLClk0Wq65jMLWGULs+RHyCsX7HH8eDjzWKKmFhCLUM94f/RSa1TJuFRV/judTtQ5wRnDwspdXc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8484
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33092-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,baylibre.com,kernel.org,gmail.com];
	FREEMAIL_CC(0.00)[redhat.com,bp.renesas.com,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-0.995];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 7E9105C9C9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add and enable I2C1 controller support with pin configuration.
The I2C1 bus is routed to the carrier board and used for peripherals
such as the audio codec.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---

Changes:

v4: No changes
v3: No changes
v2: No changes

 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 89428c804efb..493f6783d583 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
+		i2c1 = &i2c1;
 		i2c2 = &i2c2;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
@@ -118,6 +119,12 @@ &gpu {
 	mali-supply = <&reg_vdd0p8v_others>;
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &i2c2 {
 	pinctrl-0 = <&i2c2_pins>;
 	pinctrl-names = "default";
@@ -255,6 +262,11 @@ ctrl {
 		};
 	};
 
+	i2c1_pins: i2c1 {
+		pinmux = <RZG3E_PORT_PINMUX(3, 2, 1)>, /* SCL1 */
+			 <RZG3E_PORT_PINMUX(3, 3, 1)>; /* SDA1 */
+	};
+
 	i2c2_pins: i2c {
 		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
-- 
2.25.1


