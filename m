Return-Path: <linux-renesas-soc+bounces-29465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHzcBnTHt2kRVQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:03:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBDC2969FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 10:03:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C52CA3006795
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E657A37419C;
	Mon, 16 Mar 2026 09:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="GpcHJf8R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011016.outbound.protection.outlook.com [40.107.74.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4A42248B4;
	Mon, 16 Mar 2026 09:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651630; cv=fail; b=iI51PL/Aqql3Ugqy1r+MhI0PH0xHqWd9SV1amY8Qou15JiVLsB4cUEGXaxmY1J62LgAtDj1kgasJenfeWIbfWCfIaXssQUPrnuANa6a/RPra449g7I+QzuUyIi2fKHLDl1aYYXJW7bRNFXCaVHUAQup3ckMVIyRjmku77ZbGr+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651630; c=relaxed/simple;
	bh=KyI3aYH+wwDghqzb/emavSxP+DXbKlx/HiEnYEJR2zM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VSbxoywN40tuVdkczAtt6EyO/FmkK4pgaCaoH5aeeXRjGRrM9sflVL6M/HPB6Z0ZTsluIrcpewdnVuEDYtT1IqWw4ymxuSUPiJgoB5vI+UZYAm1VRg3W3XFgIOvbjL4JAyCbMosGMSUJsRvCTfM1ETyk8l2ye6SlrELmK46217g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=GpcHJf8R; arc=fail smtp.client-ip=40.107.74.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n0AHzPt6vbWc9RM9MNIu3ssXe8bHJN802ULvwgk75HBpXZW+C1uxj7nlpRBZWjNsXETrw2GXGZabmnyIeE4YO9t0f5pjugZe0tWoy6iCh4qP869RWO868TzCZ8T6Ewuev9mDXG766+c6O3XcJ4McJU0nWIO7FtKTqtyp5qMfStX9qGFYIMIMRsMlpgoztQ/oFGzMCIYWEA7Acb9qFj7pHLHRknwciQmfyBFYiSKrh+dt7YiYJj7Am58cWyhExSr9SAnh3w3hocOPoHugKo2rYzU8o014935qFIEyyVdJC5hm+D/V8dj7E3W1sBGB7d22Ww5UUqA704FheiytvWVjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eNZhjGIzYLW89VsKFFCxGzPSQQY7H2foYEp6Rj4k6mg=;
 b=ZLTtyw+RjksPCN0rldlvloLunNChMPhEoKnlc9NiDLGApbRXgVXJj+kbaPiZLLUcB0kL4dHtY+N48Rz6fPHBambe3nmAjjMn31v1zY/+OTrEkFYwEiRTgiTsdyHaLDWwu0jNMsIw0NSwQKl7FKKmJIV0mBxG4jb0pjY5lmw9x1noPuJZzEQOkBiIgvERmmfIY+S46AQvLfSaL7B25cz3+dUyMIBieOdIa4aL+gZeKZq9MDttCI5FiISFHrqZYAlOjYomDp9dKBK4QN5gdIt6z5yvqsNQHGurIIZF2HV+lwsbDOT6q6dCEpM99GESIRFprzrPfMSOgJk7ndNTP9jVzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNZhjGIzYLW89VsKFFCxGzPSQQY7H2foYEp6Rj4k6mg=;
 b=GpcHJf8R3aT98YyY6ZPWXPH+Nk+TwZ1p9MZyGWdxBWGtOmtF0U5uJuWWQtNwkLtwX0EH5Uy+LOac6SQCsM8Pw3hA8Afw8nvbuAeXxZFbnqD8i4I1CGD/s0WicYYOnBz/b9+sozupbLl2VaLxT7AuxeWjkPhKZZuwNClZou29FCE=
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com (2603:1096:604:23a::9)
 by TYCPR01MB10762.jpnprd01.prod.outlook.com (2603:1096:400:296::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.22; Mon, 16 Mar
 2026 09:00:23 +0000
Received: from OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b]) by OS7PR01MB11926.jpnprd01.prod.outlook.com
 ([fe80::5dc9:6df2:ec1:ab9b%5]) with mapi id 15.20.9700.021; Mon, 16 Mar 2026
 09:00:24 +0000
From: Dawei Liu <dawei.liu.jy@renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linux@roeck-us.net" <linux@roeck-us.net>, "linux-hwmon@vger.kernel.org"
	<linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>, magnus.damm
	<magnus.damm@gmail.com>, Grant Peltier <grant.peltier.jg@renesas.com>
Subject: RE: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible string
 for RAA228942 and RAA228943
Thread-Topic: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible string
 for RAA228942 and RAA228943
Thread-Index: AQHctQbECX3oGEqMGkWcmsdZQcz2dLWw0tmAgAAHG4A=
Date: Mon, 16 Mar 2026 09:00:24 +0000
Message-ID:
 <OS7PR01MB11926C7139DE648454D744DA2D540A@OS7PR01MB11926.jpnprd01.prod.outlook.com>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260316053541.3903-2-dawei.liu.jy@renesas.com>
 <20260316-intrepid-koala-of-snow-33eceb@quoll>
In-Reply-To: <20260316-intrepid-koala-of-snow-33eceb@quoll>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS7PR01MB11926:EE_|TYCPR01MB10762:EE_
x-ms-office365-filtering-correlation-id: 68ac8a12-b9b0-4de3-363c-08de833a760b
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700021|22082099003|18002099003|56012099003|7053199007;
x-microsoft-antispam-message-info:
 QhaRgywvOenI3e5O3paQbG2+laCLgsflZesLWHn4dEqQColggnlYtPVvq475BjEi+gZyo827G6oXYcJZKoOUoqTBiyWeoOP2Gt+Co43tUHbHS+e3aw/OiGhR6s8PVkJFy/Vw0Ub/S8Emg8pfb/B3Gpy9FFUCQ/yhqloudD/rLyvB6OHw07RhDFR3p6xwFra8nWTkf7+ZjX5X5tzP3T4zolJSJywNyBAU5guFo71Ix3h2V0kumQMtMOZn2aCWz+cdCk+GNx2B1yUX+H0nR2fqlNR6LoDByO9Ku4of06U7Y2FMAAlCO2PEG380Ll1UaT/I5jjoUJik3fWIqISA96X6qlj/jqmcucf0DdEap0fHM71sTj477uY7haF0Ki80cr5m8o+3tzhJ19az+WLzR265s8BU3uPWLnVCf3ZKCHGze3jsDuZBGdj6Jl93Sv5buHm21FkyP+vR/f0udUfa3olNlaMhnjzPFCGcu/7+nRV8+iKQB69wQCFcLqtgupIt4ImDgYuLRuVgr+UcX2vSLC1czAdGm75hcKRMa4B45yEfTWDVwE5CH43iW19KV/kZWij/lqEGVgYAwFgBdVfbhV+l95bmeb2UazX34gPNFeN6v3qQlCtsSU/WFP4ddev5WTl88NwaZuLB2PYQGr9N4xfM+hX6SoeqwDYATMLd7U4KtLJ0fcpmtlXmW4v/c5JiLQg4xo52Kqz7eYhRONqNUFaXM1etr8mtkwxH7BaZKAIh0E4rtllyC5Z2SU+/r7DMKcdsJWUkMHX3+0LsJhsDOHpFZ96ozecg1m0qmPdABlb9/cw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS7PR01MB11926.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700021)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zhrsYxQXwGlnZckQBaFKqcjdhMYQSL0Vq1GDOcJ4xPaenbJaj8GRD+FLF1Hv?=
 =?us-ascii?Q?Nfdb4mC2dvsELNA6UfK30JfkB7GVKbtT7U49V+v/5IcYBaYKpaf+mOANdxwy?=
 =?us-ascii?Q?hbmPG+Ooj94AD2bqfm0aJIoc6Ow/rCtAaetEJxuWkh8HxjsBDLp8SZurS4lA?=
 =?us-ascii?Q?iZKeAxVfK/MfXBMK8nY0sIeXP5N6+x/l8LGnkmPk4kGiNtSr6MoEuJYMYeSe?=
 =?us-ascii?Q?qXcN1B18OHsjhaxBpkr0yb6ICcMvZCEFuLLmTkl8Fnf2FaHIz3l1sDO1q/9n?=
 =?us-ascii?Q?E0lwuWgougAjeqTUwmKM9LVHg74N8zyBZcuZwgID1OZ7J0wChD9ex0x3ZMI4?=
 =?us-ascii?Q?cWY36nk2azmMF7OnJ+n2Wnc4dryVCdMWIgnEQDh92ZdHlPrrzXw2vKZFJpCK?=
 =?us-ascii?Q?usXHP8/gO9w/Js3RANnbU1rag8yokzzdqC5PbXMK3/EOaO2BWHVEez1JiZzU?=
 =?us-ascii?Q?0ViJQgm6QZ6ucj01N2zVlXTjRrmcvy478u52kcWQpEfyrJn+UyTdo/2/t8bo?=
 =?us-ascii?Q?5KrA0ZIV2R+xXhyXOjHbfILJtqK4zN4ZCiFTrTJWH7fc+KijCExy71ydP+Lr?=
 =?us-ascii?Q?Qg+XSA/7sYgkIgj1hmNA6faHBhnUxwiWbZY9fouUV7KZ1yLSwRPcNs01QKPY?=
 =?us-ascii?Q?ssh9dhuWwmDvFHijExXlUb4ws3REZG8x3gve8cLg5MOTa9v5/wP1hEAPDTCl?=
 =?us-ascii?Q?Y7dSNgOcHmfTqcw53J/BJZ2NL/pE2evuwDAj4B2cEFGO4zddGeaLaaTWIJs6?=
 =?us-ascii?Q?/avzuRYvLBVH+uwgZU6ajvKsGTat1djHmBOhufqyP7MNQr9XQlG5DEgShdmJ?=
 =?us-ascii?Q?ODAtr3778xVsczh7nt0X2Y6MWDlXGcQ2tg9EXXPbP5nMHuvQO6KVjvpAt73C?=
 =?us-ascii?Q?Ds/Y+zN2che33c+8KDjZu7qF19iwiUqWakKTZqjyVi8hRQuvEtqPlbi+RLIO?=
 =?us-ascii?Q?8zsKj85Y7vLm6s33rVeXSjAssP4F/QtyOzxiLNf8BSDV3EKap2UtrB6stZHE?=
 =?us-ascii?Q?yr4Dq1KNc8lIRflkUZx1OHWgQWejnWO1A34K5T+x9x9K8QV8psKddHIXcnPZ?=
 =?us-ascii?Q?gQy1UnplMnmIFSX4Ub74pIyehad+67mrMKVi9P8r7ZaK20TXqWrXdLIW4wAt?=
 =?us-ascii?Q?pI/ZPwb/HbaXJfIhCoLAjVtwQ3S0R8lP4xBZgPtkoYc3AsxDuzcDYz4Phf0/?=
 =?us-ascii?Q?gkFXamcWium+IaRNPegExMs6+QSQ5cOxWuFqiMvmpdHnE3vdk9KfDcm7Zdum?=
 =?us-ascii?Q?vMBnNk+rpO1ABdexAC/4s9VjkYPdr8isXnEm8jdFGatJmzzAtE2oTg/suMkx?=
 =?us-ascii?Q?R6ol4Vc5mUdhL8DJTwfcHCSItomK+Gtr+c5/0ELVMNHxaQAQ2X8LFTC7iI8O?=
 =?us-ascii?Q?TBoMsv3YHStHJtDBSyif7xZYxt8c9bQyW3Xzwf7lnIs6QDxTBBD/teFAlDW1?=
 =?us-ascii?Q?914gU756ffyKRA+na6urztqJ5AoMOWVZ/gpYzyYGvDx1dxZHoHEJgDop95Z2?=
 =?us-ascii?Q?OvJNHgpsrUgi+FLaQPHEN6ovSK3AqiXNzbmtalN+zOLd6OQYFucvbrsoiBXC?=
 =?us-ascii?Q?TxTlAC1lPRrDrHqBbQx8nYBKGGMc1YiTBFezIDNcnOWVKLzStzOl2ofJ0fRn?=
 =?us-ascii?Q?VD4nOoAFIzSBEKx1vSZSonliyWFvrlbubWQhiDIJeF+3COtYpHHxzXETCyN1?=
 =?us-ascii?Q?TKWyIaff+WUtmJoxo2cjGNAnTOcnkf4Q3TDXABBcHq1ZlBY12Hsb7uvn4YKj?=
 =?us-ascii?Q?qxLQc8/+8w=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS7PR01MB11926.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ac8a12-b9b0-4de3-363c-08de833a760b
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Mar 2026 09:00:24.4724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ohvl+x7+v3cvZnjKJizFvE+mL7mgt1Uhh26uU6VgafIh4TlKnql3wkRHqvHw9TDRWFAShDUeprUIjY5t7/K5vYu+bMkrLhIZQL+i2AOB06E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10762
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	TAGGED_FROM(0.00)[bounces-29465-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[renesas.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dawei.liu.jy@renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6EBDC2969FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

Thank you for the review.

The RAA228942/228943 are register-compatible with RAA228228/244/246
family, using the same PMBus command set and the raa_dmpvr2_2rail_nontc=20
driver configuration (2-rail without TEMP3 sensor).=20

In the driver code, they reuse the existing device configuration, so no=20
special handling is needed. That's why they're added to the enum list in=20
the binding.

I will send v2 with improved commit messages to clarify this.


Best Regards
Dawei Liu

-----Original Message-----
From: Krzysztof Kozlowski <krzk@kernel.org>=20
Sent: Monday, March 16, 2026 4:26 PM
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org; linux-kernel@vger.kern=
el.org; linux-doc@vger.kernel.org; devicetree@vger.kernel.org; linux-renesa=
s-soc@vger.kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel=
.org; corbet@lwn.net; skhan@linuxfoundation.org; geert+renesas@glider.be; m=
agnus.damm <magnus.damm@gmail.com>; Grant Peltier <grant.peltier.jg@renesas=
.com>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible strin=
g for RAA228942 and RAA228943

[Some people who received this message don't often get email from krzk@kern=
el.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdent=
ification ]

On Mon, Mar 16, 2026 at 01:35:41PM +0800, Dawei Liu wrote:
> Add compatible strings for the Renesas RAA228942 and RAA228943 digital=20
> dual-output 16-Phase PWM controllers.
>
> Signed-off-by: Dawei Liu <dawei.liu.jy@renesas.com>

Please read submitting patches in bindings and process directories.

> ---
>  .../devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git=20
> a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml=20
> b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> index ae23a0537..53d07c0ce 100644
> --- a/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/isil,isl68137.yaml
> @@ -56,6 +56,8 @@ properties:
>        - renesas,raa228228
>        - renesas,raa228244
>        - renesas,raa228246
> +      - renesas,raa228942
> +      - renesas,raa228943

So are they compatible or they are not compatible with anything else, like =
driver suggests? That's what commit msg is for as well.

Best regards,
Krzysztof


