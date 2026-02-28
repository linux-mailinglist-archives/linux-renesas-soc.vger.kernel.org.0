Return-Path: <linux-renesas-soc+bounces-28596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ImuNWtWomng1wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:43:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 399CD1C0032
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 03:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6B0F30470DF
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Feb 2026 02:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 185A232C928;
	Sat, 28 Feb 2026 02:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="sXbxibhd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011005.outbound.protection.outlook.com [52.101.70.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B333B2C187;
	Sat, 28 Feb 2026 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772246633; cv=fail; b=TXtd80GfLI3jizlSmOWxo7iMdsI8Ebb0kWzPzpHzPokHLujjs1QtTfY2iTQxsB7waJDxD7/ewU9amXc6LaXIUcZUDeBj2tzWiNL4ws+ceV/6h9O9lLVFEvyYnLTSZz7Yu0sJzHE/VK5f5vOoLlogtKvgQTz/1vAaMyC44Ze8cig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772246633; c=relaxed/simple;
	bh=REF2O+RELrpJeOEQuE46t1ZwScusEmBn3KXbseMz6+8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FviBpmeD+SzS2GfHmLO34bprytaH0wUPxc+Y9Qg0hQ6oQJ0nTIWJTp2LQ17ZrODqkAxwLDaBaow2/ze3ZDqdVrJszSVSSPgheYHwOh4Nc5tnPMi+AesYBm0TGLdDauyZyniHAQeXZon44iMLFYNBGW7G/UMfzGMlBX2HDav5XX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sXbxibhd; arc=fail smtp.client-ip=52.101.70.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N6b2H9YedmPMtRcyIqQCBDoZYGK1ssZOZDDkaT9ob2tc4zbC+fy90UgKL24G4dTw5Lw5H/KyDbunQY+uNyejzNGdtmE+jd4Wgen/18ww0mlUU5jDazTi9eojQbRGhsLFowx0m+/4s7kA+trsxKLLoxtGXdMi5YBTwpdmr8Mx1u/sW0FhUwWaXv165aQCZIEomneOfIxezkqNwXS6F9WK3UQxVWIkp9hR2ErXfxBmDxYklwWYcs+4n7p3qNHkFYztnmTLNAyIobRz0XtOSq7piwzKK3F6b62soQM31gezwm+nBDs9CXC/SLKG8w9nghrWbYUnzRh0E6h7MRoQTywXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aEB9cHwNXgVLKRvJsZafd/Ix0e8Mk5Sbqu+45TfQux0=;
 b=T/dQtclEj2o6Fe3+H5Q2LJ7j7PRaPx87mh7PUcj05G9fUU92tZWoaz8k+6OSaTHfWKZNmbIsZwh1iXAiPsElILSvWtSNPWbVyLqUx4LDWCmORRd7VSfvqEGxeOqF5xiZporb/xXovBuHol197L3dtY6jxyypT/QrED/cy+UN8n9cgpF26SvL592RjH0RDWdqJDw3/FXj3eQM58CTr7InD0bgJM5kwkZD2wBN/vaGDOSxQs8aUugO67or8l0Z7oeql3vzBWDAfLsQeWYPIANrUDIGqO4wwPEgKCPInpMOxPm0JNBeXsRbP+iynDNtYgrrpoJzyQkHcGKYdQoZbdI0PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aEB9cHwNXgVLKRvJsZafd/Ix0e8Mk5Sbqu+45TfQux0=;
 b=sXbxibhdQ5BYW3TmYX+LDwKzSqWNNaxD0wFYKyufwylzhgZd7TIhdXao/DEXsDHuwNgjpNY/DAYGJOBPqmizQwNtMRp/lcx/hNbsFEuwWaIrTQXz4F2/w1B7Tf1gkGU/lTr+bx5mhRw3JJB43Su0Xhv5p4p2hmuDUOGjy1V135cnRw3YtDm3L26gnhzE5ZVSjRzPnwldDopozvMag3zvjavtkfaf/7NzBuShcbvkLLDdShAox0kXQp9eab5EGWAW2F9XuvNeS6lL7iKQgo7xtVJsTtGtb732thDo5wbFg+c73Fcw3HTzg8wFhP4r8Jl7dMz/X77dJowXzqHqB6449g==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 02:43:48 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Sat, 28 Feb 2026
 02:43:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Cristian Marussi
	<cristian.marussi@arm.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "sudeep.holla@arm.com"
	<sudeep.holla@arm.com>, "philip.radford@arm.com" <philip.radford@arm.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "vincent.guittot@linaro.org"
	<vincent.guittot@linaro.org>, "etienne.carriere@foss.st.com"
	<etienne.carriere@foss.st.com>, "michal.simek@amd.com"
	<michal.simek@amd.com>, "dan.carpenter@linaro.org"
	<dan.carpenter@linaro.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "kuninori.morimoto.gx@renesas.com"
	<kuninori.morimoto.gx@renesas.com>, "marek.vasut+renesas@gmail.com"
	<marek.vasut+renesas@gmail.com>
Subject: RE: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Thread-Topic: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Thread-Index: AQHcqABKO+hcVh6iZkyalePQjkJUebWXaD8A////udA=
Date: Sat, 28 Feb 2026 02:43:47 +0000
Message-ID:
 <PAXPR04MB84594E5C9BCE2B5171D15FEB8870A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-10-cristian.marussi@arm.com>
 <aaJWfq5HRQHxk61E@shlinux89>
In-Reply-To: <aaJWfq5HRQHxk61E@shlinux89>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS1PR04MB9384:EE_
x-ms-office365-filtering-correlation-id: 032aabb8-e7d2-47ba-6499-08de767332de
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|38070700021;
x-microsoft-antispam-message-info:
 peY1doTMfaWS9yzCdNYS2puXyQZlirbvml4EuWyY0ZT0CJ2OBFN8MhJiiNtSnU8vITBMvHyXFzy3Z2hR+679CLs+4aE/27gJslsjIddNJYIrzlHF1T8aOUAG53lerqcQja+RAX3mdFFutK3fgnXBTHpLMcAgchIRUXBdZf8PlIJh3xbyACNTWncVdS3V3XLm85pqE/uBOUP9rXnNSBWGb8owQ2xOMQElV5wsu72R9/HpfsGuQj84tzkrGwzZn0cq5NPyUK8pw9TLyX88AFxnGcomQMOG4daGn6vXwYDJRVqgiNxzqnkWJH1GHgs/CsZfdcbPkMmglNgXtKha2p4n/DkJH8tsLXrIax97dElvDfyLki31vsvf5/FDhD1xmVkc63ACGxXtCgL/svI0PM50z1Vh/DRGvO6StGo2+88/NWLsZxwrBkl8esxQzxNAac1SLEaGFqtDM2RMwahyQ9uHcbif+WagCGU3YKhBkd84AgcJ1eGmM4pZ/aRdGDz5qe/njtzsQRF03bwuOzGdkADNbDX1v1t/7O2nh2RABD9IeUUHsg0npEaF4VUvujnJwmPYr5I2p1P0zNhdvJABxa9/P00jxfBUJbFhF4CNDbQFJVnxajcsRnDgMZHGtgIkbZ1Kmq+QfwBWlH4M32BW07wy4vBCMD6VpUZKsJBWfFao9jkhEB0ydXlNIKvr0l1Jm2Ml4ycz1ArSkRq632AzhC+ggieJFKnmKk/1aTkbWbpYekq3HlXl/NEj9QFlCo02GJ9R/gi0co2Xl6momrWvHH0VaZo4Il+ncpF4HmxDFOnwMx8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vI4Ewix3Dpw8+sVHoGPvnLKCsGqHrCjEw11Sfz9ieWFrF8bxwe/AgTmQTyVt?=
 =?us-ascii?Q?1QkToFHPN9cHVjstw1fYYE8YVIxjl2zfSN/6XFC6lU6MVrfJj0ABmlHZ1Chc?=
 =?us-ascii?Q?+M2X+067b9d/YF9svMr3PcWWA2EJ9ZMA0nFVqs5Cmj5Y+cvaCF+nLWyl3Mhd?=
 =?us-ascii?Q?FXUWMeKWQEZ1U3ttdJlMiQlsehQVMnKAxITwdlf8eDuIrLDZUdtFEm27IVGm?=
 =?us-ascii?Q?KwudD2M6Rt0ILSLKymWM7/aQgiljMm3wwRyyHkHH8F5RqeYwUukrRhF/ZnrD?=
 =?us-ascii?Q?kp7jhJYPni/Aie6Av/4wV6TwYB11kX8lLmtHmTtRTO+iXlRw10LBmi5w8qbu?=
 =?us-ascii?Q?4IVMR7rVAXuGTKnArbHxkfMj1++A/kPuxD9dh9Ljqk26JFGOVHuOvNuPUxZz?=
 =?us-ascii?Q?sInNMTv4VKyIdZKn2DvceFIMwDCbg54QEDlckeZ8RJgGoSLgln9g/v64mjmc?=
 =?us-ascii?Q?dleF+1wcbpmL7ttnvJZO8l0IvNinp8fkVChFlznlT2MfTj72uCKQhxN9PA+q?=
 =?us-ascii?Q?UDWCCBpEH09u98YG4WlYydTmkJ3X+hBD9e5ROREKE2bLKHsTxzHLBLMPHMQJ?=
 =?us-ascii?Q?/VHxO2fTp250P6lgArvOyk22O9DIiz5XbqNBISXt8PhgOCye9JBOvCZQZeQu?=
 =?us-ascii?Q?O8yi+Xoi5e0X2N7a2E3wZHFLpomTKrctohSoTRQUGocjGyd0mXIe9PXYZFc5?=
 =?us-ascii?Q?gO7fN9ZKO8pUPCkTpoktD87jY8jui6VW9c3AE8LwzssG8ReHvmn7tafG/LSd?=
 =?us-ascii?Q?UVy8T3zLfzSUJP1Pr44RNGsYDzyh/65yIRxeTTmsSB4YxQleDPvMMCie6R59?=
 =?us-ascii?Q?BlrGLh/llVmP9HCnxp8I54TANLtDCU+HOgA8yOjpmv9W/zeozmsLbzTtZfWT?=
 =?us-ascii?Q?o8qfvExmg1CkTeHpARvKRDw0AInjvE5M26ERA7AaI0Iyi21jHWnxJvlL83kV?=
 =?us-ascii?Q?rwf7G2l/+WWruV9d1SG/crSr3DJi+cNb5p92qVyT/7CH6De6HR6b9MVMPMZZ?=
 =?us-ascii?Q?Oh4/kNs7EVi+CKG+4M6DMJGse+nudt9yLnNx7IYPGLblvGAUwvy+eBi5i29v?=
 =?us-ascii?Q?e/IcswxWLj4svrXlHhOAzmVIXBwOnMswdTNrXIK5iqwDbp+fH8SZMHAC3Iwt?=
 =?us-ascii?Q?uO+8H67c4VWG0Uw1fvLGG45ON2f0JuEkVPHSjLUw7m28xuW0PlV1N+uiGbDM?=
 =?us-ascii?Q?mvI21tvZ+qdElx5kOJ9GVQXcPJL+Dke1FN8vjf0gtHsmWQFMixf6E3L8QgJA?=
 =?us-ascii?Q?m++fBu0GxCf1YA2vABdRYV/Vz3BbVAaN/TdY9Ga3xH8LOd0nJIIjp+1zl1gd?=
 =?us-ascii?Q?gG0cooHBHdH2GPI12FllaKeatoj0m//XkwnuM2R4rtpIMQRy7Ewe2hCy4w0e?=
 =?us-ascii?Q?be05mSkGgRd6NAuvoU0nuRfd2EtoGMj7XgEXleC4PLVW+VdGsI5efJtpngne?=
 =?us-ascii?Q?QlnT2Kunv3AZH8bJjYyeY8p9lqLwMIBHbXaB/Ykrph4rDTnLCDEVf9vxQZVA?=
 =?us-ascii?Q?hPo2LslGsxfmlM707EfbGjFOJIad7YXN736qeCr0oXOuR23R4pAScP8KYBff?=
 =?us-ascii?Q?fMjkXeLOenyBrvqWxvs/VPLuGZybXIbUdUVQq4WoNyNHXiQF/MlS8biJYoiV?=
 =?us-ascii?Q?OpMW9Ioyo+eD+q6ISgAiPigOyb6PvsFwnFL4/qTdOpYutm7hy8GYgFjOqfxZ?=
 =?us-ascii?Q?qNV+hTml+VuZTo+HPWVA/EmSwAEg5HS1Lb5OXQthktTP2H8K?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 032aabb8-e7d2-47ba-6499-08de767332de
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2026 02:43:47.9408
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nUd7U0mgoHRMQxBv9Tmdf3Jrn/giG76kVkrLhiUnBT2NEfyFoOYm54Xlvo6092h8wC+Y6sj+umIkwiW+SiADJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28596-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,amd.com,glider.be,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peng.fan@oss.nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[NXP1.onmicrosoft.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,arm.com:email]
X-Rspamd-Queue-Id: 399CD1C0032
X-Rspamd-Action: no action

> Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators
> support
>=20
> On Fri, Feb 27, 2026 at 03:32:23PM +0000, Cristian Marussi wrote:
> >SCMI core stack provides some common helpers to handle in a unified
> way
> >multipart message replies: such iterator-helpers, when run, currently
> >process by default the whole set of discovered resources.
> >
> >Introduce an alternative way to run the initialized iterator on a
> >limited range of resources.
> >
> >Note that the subset of resources that can be chosen is anyway
> limited
> >by the SCMI protocol specification, since you are only allowed to
> >choose the startindex on a multi-part enumeration NOT the end index,
> so
> >that the effective number of returned items by a bound iterators
> >depends really on platform side decisions.
> >
> >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> > drivers/firmware/arm_scmi/clock.c     |  3 +-
> > drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++------
> --
> > drivers/firmware/arm_scmi/protocols.h | 13 +++++-
> > 3 files changed, 55 insertions(+), 19 deletions(-)
> >
> >diff --git a/drivers/firmware/arm_scmi/clock.c
> >b/drivers/firmware/arm_scmi/clock.c
> >index 15faa79abed4..d7df5c45836e 100644
> >--- a/drivers/firmware/arm_scmi/clock.c
> >+++ b/drivers/firmware/arm_scmi/clock.c
> >@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const
> struct scmi_protocol_handle *ph,
> > 	struct scmi_clk_ipriv *p =3D priv;
> > 	const struct scmi_msg_resp_clock_describe_rates *r =3D
> response;
> >
> >-	p->clkd->rates[st->desc_index + st->loop_idx] =3D
> >-		RATE_TO_U64(r->rate[st->loop_idx]);
> >+	p->clkd->rates[p->clkd->num_rates] =3D
> >+RATE_TO_U64(r->rate[st->loop_idx]);
>=20
> Seems irrelevant
>=20
Ignore this. I understand wrong.

Thanks,
Peng.

