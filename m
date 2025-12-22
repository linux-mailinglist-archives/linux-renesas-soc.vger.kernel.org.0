Return-Path: <linux-renesas-soc+bounces-25976-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8CACD5B6D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 12:04:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 763EE3007CB5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 11:04:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC42B314D2C;
	Mon, 22 Dec 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="EJx632KM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26745226CF6;
	Mon, 22 Dec 2025 11:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401472; cv=fail; b=bBse2rdNwO243uqTQ1pR0lUQme41qDrfp8n0KFoGSpS1RV3PnI8cpp83JKF9Hl86xAxr3VGaxa8ylKFZF2KDaHMSMSBrBTEa31dqR24j7d+dea/YzD3uhtHJoBH06yGg2XksqPUdXljSzeRFpjHEyJPpSnZsE8FMWQBKO32LRlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401472; c=relaxed/simple;
	bh=s9d6k/D3gKPSGY8b2WO0Czh+9EhYxmi5egP5TwlzvRA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=r0unkZZviq/raUkMV3kSa5NSjFWj/AjuC+Yr4SBPr1E2q2W48pXoKlpWLPCyPlVAwx6s6QStd6dr3YfeR6AKbxV8jLsqs2LQbQMK03Peg//wOx/T6yX7KgZPerneW+3hNwSAu8AJPi1OZNlydBNf3GBs+794Uavk1OFQQoSu8KM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EJx632KM; arc=fail smtp.client-ip=52.101.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrDLGf6Za9UIgknVLhoILuUYGGEty3Ja5WIOfMCv+y/YVyR/3G1FB+WhMqArg0vPpZaBDUsFJpgwMHzwnTfa+QzF3jgGwG1cxPlaRddLvAk9tCG0rCalxJGbFg5boyjQahkgUoPs+/58WnKoL7w2lKT64RmyT28z5kWwhB4gpDoFXW67gr90evIqz3G3mUvBzXcLbXsg2TQI73BjmhOzJahpLVrCb24YJdMHauiMGTe8opzisxdzkcsKeEiBpX2k8SyFGWMChwdQzs89DhhKPLPfvWzUViWsmAY42ejM5vQGo/1K4GjslB/4XLDBw/+04uMgeqT/7wEMNIZjq/r8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9d6k/D3gKPSGY8b2WO0Czh+9EhYxmi5egP5TwlzvRA=;
 b=iO68zLpyqLWoSmEBsBdgW9U15dLG5EZOv7RDACg5toVmKDjMT+yTWkvUZUh3er+dh6JKCg8X6/79k+m1J72hVLv9rloG5ANnJzSf/ZheMcDWAhCFi62xVPBgGjWypNCRostTv1TU3c3DUNsTOmR8OBt2bLEijLXX9zvSfPsXdWeAh6/T0LR4b+YSUIDV5Wj7/i0w3vyxY+eqK4tgh0AKJh/055DrVtqsfWMJEjyH5KuAoq+Rt+7ozJx7Ro1v4/ZeuUVVdfeORI2JExD+zYvqY9fbfl8vstBbpodgJj6a9q0Ty5Mdd06i0I1FweU0vN59S6nWEVod2oAhYhRIaQA89Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9d6k/D3gKPSGY8b2WO0Czh+9EhYxmi5egP5TwlzvRA=;
 b=EJx632KMtHCAK20D0LTVN98XYFI6iQdQnpgS+YlyVpnWJ+yF/nsCb/A4ja4iJ77+mzOLw8bwOB+AdekWx0hHNj9VyZ9VeoqYg+EH+0ZTdABQZCb3p3d9LXEvtb4ap1NpELEhgrgi6bQlT5NAwlsBJ1OAyuay6qusQ9SfODWgjr0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB10728.jpnprd01.prod.outlook.com (2603:1096:400:294::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.10; Mon, 22 Dec
 2025 11:04:24 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%6]) with mapi id 15.20.9456.008; Mon, 22 Dec 2025
 11:04:24 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Josua Mayer <josua@solid-run.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYr6fMjaP0/3KT0Wqx+rUGWyUpLUMuQqggCDlQQCAAABUoA==
Date: Mon, 22 Dec 2025 11:04:24 +0000
Message-ID:
 <TY3PR01MB11346909D4DE29AFE7D229B0786B4A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
 <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV52FEGdW3Jqtn_=yhZ8h1hf5h9nn8d15Pkgmq7VJwnSA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV52FEGdW3Jqtn_=yhZ8h1hf5h9nn8d15Pkgmq7VJwnSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB10728:EE_
x-ms-office365-filtering-correlation-id: 30c930fa-f11d-4e22-fd1b-08de4149ddd5
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QnVMYjdLTkMwYmxnR2xJa09DalA0bVFncXM3OUs0RFpqY01jTmdiVDl6aWhj?=
 =?utf-8?B?V1FGOVFLak95WWhpclF4eU5vbG5NOFV5OUVwN1piSkZZb1pVQXRYMmVvTGlo?=
 =?utf-8?B?VHhmWlE5Q2VBaitvZ1lHSG5xRzFRUnczUW9GT3lsQkN4blY4R3VNOE1MZXBz?=
 =?utf-8?B?MGMrNnVoUmpMNVI4MzI4M1hrQ3ZYNThlRXBidmQwWVZXa0J0R09pRGhwSzVX?=
 =?utf-8?B?eDdlc0Y4Z3Fsa3N2dmlDeVhNZ0pDZUFaQU1QNVM5SDFPbm1yWTZpei9DOUNp?=
 =?utf-8?B?L2ppaXFJQXRGQXJBcnJmVGg2c1dNeHBzeDQ0VHNFYkxVNUpSdkxZVjlWSEtu?=
 =?utf-8?B?Wk5hM0c0VXpndDFhS2xRRnI5QXF3WlNXL2NJVkIzeVk1bVlydWFPMzUrditE?=
 =?utf-8?B?Rk5qczJYalBxK2swNWxmdGpwbXJRaTlUQmp3NmtaaitULzFqTlozZ0d2UkVn?=
 =?utf-8?B?dGp3R0FPcW1QLzdHQlZkWm1SZ29JWGdwZXlwODVra012R2s0Y1R6NVhPU2h1?=
 =?utf-8?B?UUNQWVZ0Q2x0OXptRWVzZDRTdGdiNXNrTmtzVWlMRnVZdFRmUHlQdmRXRjMw?=
 =?utf-8?B?Vlk3RFh2RElNU2NXUzhETmQ1citTdG9tZE81RkRnUHlHYnpFU0lPb0dyOFVK?=
 =?utf-8?B?MXJVWkRYbE43cForYkdBekdtZG93Ry8zYXYvelo5anNkTW01NnFvRHNaK29F?=
 =?utf-8?B?ZURIM3JBeVFGZUtFb05HMDhRWVVLbVUxemRPNmExYUJUV2w5Tm9peUNYbGt0?=
 =?utf-8?B?WkRLYXN5bjJrQ0NOUHVoNndocHIwOWY0MHNJOUtsRXRzWHY4Ui91Uy9XVldZ?=
 =?utf-8?B?d1pzTnRKL2VVVitwTytYMEN0Y25LcFFmbmE1UDJ4UnBvR2o0bHZqeUxnNUlr?=
 =?utf-8?B?SDVJWHRFTER6RCs3QnRLcENCWmR6QnVhSTZSeXJrcGlXaFNkeXVTeDdJN1dH?=
 =?utf-8?B?OHR5NUl2NFQ0dXBNM0YrY2Vhc1ZnV3pIWG5pZEdSeUEvMEZjMlduaWNDcDJk?=
 =?utf-8?B?UkpTejZkNWtZWW8rSHRXVFNNVUdyZmY2bi9waUMyNXlKWWZibUIyMUJBN0hR?=
 =?utf-8?B?VmJCTFlIeUhBaHM1THM2cVNUUHBsQkdXd0phQnREcWxIc25sRk5QWEJLa01y?=
 =?utf-8?B?eXkvTXlGMEQ3NjJNcXM0b1M5MXVkVHQyR1QzUnh1ajNZMEtUOGsvYzlyOGZu?=
 =?utf-8?B?UnBSNUV0UHJjNG42Y3pqVlZmdmRMdFY0aXBRV3I3WWJ5OEhEc1J1VjlQYkIv?=
 =?utf-8?B?RmtFcnIwK3ZSUG9xNHNIRFpabEtUVlYwU0RBLzNuZHZ4NXlDTC9ZUVhWTnI5?=
 =?utf-8?B?OWJsczREZ1ZsdGJ1Y0t0N2I3KzZET1NmQVJUTmNiSHVIU3BFN1h6TzJDdThR?=
 =?utf-8?B?SnJBMkxtemFiOWhHa1J3WkV4ZTA5anlLNjVxM0dmZUlDNUtqQXNTL2l5N2RT?=
 =?utf-8?B?c2Fod3A5ZWJCbzVVMFBxZmRYSUdrWGErWEJwWGVva3FqdWhIYkFkMGRzdFdZ?=
 =?utf-8?B?S0VERmlPMGtCZDl3SEdzazcxS2pKYTlrN09vQUI4U1l6M3o0cVVGd3ZYWTFY?=
 =?utf-8?B?NWtJM1lJeno1MHp4aXMvU05IK29ya1RRdDVlVllqNFNGMExkb2lwQThDak1y?=
 =?utf-8?B?Q2pMcDM5K2VoOVpzMlJwMSt0VU5rR2tUYTFEM1dIcFQ4Tyt5aS9GZjhKb3JW?=
 =?utf-8?B?ZERWUm1mUkdhdEUzVHpZczY5cjRsR3VnOHYrT2J0SDNtbXNQRXgzRDgwOGg3?=
 =?utf-8?B?eWdVRlZPNndPbEJpc3pJWUtqTWRtVElvZVpJUzRFSTdQajcvT3Z0S2prYUdT?=
 =?utf-8?B?NWR0TUhiWXlqamp1c1lwM09pbXBYTU1HbUFYQzEvOTJweXRycE5WdG9WUlQy?=
 =?utf-8?B?NGd4dkpKRXVhTlN5bDZqWXFHTFVJclF4N2Q0YTB6bTcxb1FjRGI3ckkyeTBv?=
 =?utf-8?B?SHlaZVAzemxSQzNmZVp6TnZ6TVhzcDYyVUx0YklpeUJkTkhuSmZQYlBFK0tF?=
 =?utf-8?B?K21SNGxMT2k3YU1BQnpCSTFOclRHTHJBL05xNjNFWmZJQlFZenYvV3VaOWFK?=
 =?utf-8?Q?SC8oIs?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Z3BwUTJjZk81Wld3OHdYYWFqcTdLcWtMbVpOOHdudEtxc3lMbDB4aGwwd3dH?=
 =?utf-8?B?eE05QWNSSW13UkdYSTJlbmVYWVIxYnlRbDIxK0V2Y1BaQ3J1Ti9HWnp1T2NP?=
 =?utf-8?B?VjMvdXVnYU8ycUJWZEl4UG9OWTVHQmtETm5KRXhMZVQyV3pkejI0cUhCZ1cx?=
 =?utf-8?B?SXorRVZyMENPOGlwRWRiWDQrWHpEMUlQOC9aaUd1eW5OK0Z2Zm9LRHBIWTFo?=
 =?utf-8?B?V2MvK1RoUnZXeVNLNXgxZW9UQmI4b1QrVkp0QmhuRTJ2a2NQR3NUTmJUWDJs?=
 =?utf-8?B?WldMRmRoN292Z1BCNFRxeENDV3B2RnJKVzB4VnYyZkhlRDdiZG94cjlaZE11?=
 =?utf-8?B?QzdCa2owLzhXQ29VTE91NzNyM2dvZmNCMW9iS1g2OGwwZjlxTVdnR3IyN0dK?=
 =?utf-8?B?YzBtK0NVbEF2UGFRUGdGOE9jbjJwTVNLQnpUZDVCeXRlVWNCOWkveDJOSWxN?=
 =?utf-8?B?eng2Rnk4R1ZHd2oyZTc3U3FQZ3FLQ2ZicDFyVHpmOEtUbVU5MjZGZFFOTU9k?=
 =?utf-8?B?L3Y5VkNNZDZFQ3Y2QVBGN1B5YjVpL21SNUhCc3RjYUFudmVuVVFUMW5EdndB?=
 =?utf-8?B?MGJDNEs0TEp5WkIyRTBpTmltU1E5RklpRjBVSndOYkNWbFlGZ3BaL3NSRWd5?=
 =?utf-8?B?ekRkRkpaczRBcnlkcXV6ayt1SDFqUDdzYXZtNmM0QXdNd2F5UW1wZ0NqNWNK?=
 =?utf-8?B?VWZDRUwwaTB0NVNsTkZmc3dMWWJlOXpybmZyWnV3S0VPZ1R1MXoyMEhMcjRt?=
 =?utf-8?B?WXhlMlZlcGFvRURtbmpXSzZ2OVI3TDdrWS9ZWm9Pdk9xOHpoTDg1UzJ1U3ZN?=
 =?utf-8?B?MVZLQkdFYzBEUklFV3lDMm41Z0pTQlVEUEJSYVJSTjdudTRJSHFDc1d3Q212?=
 =?utf-8?B?ODQwVUFxOTUrYlN6NzBIM0RWbkFYTHhNUGo5Y3Mva0xJMHFKQVlaU1FkRkpK?=
 =?utf-8?B?UWE2MlpIMmM2MGp6V3pkWmw4QXk1YnhuVnJXNWg3OHBLM3U0MjJuWmQwRWRa?=
 =?utf-8?B?YzlqcTJFYytLemNxdWtLZ1JtVUdDdUJLUlNQNnk5bmFiRzA4WVdsSlpPYll5?=
 =?utf-8?B?VFhlUEFFRFRBclhGaXlLNnJWblZxNlhWa3FNS1F0MWJxOVZZS0xmSVByS3o3?=
 =?utf-8?B?OFJhbDlOTm53dHVQcVFESTUybC9KZC9iNGRWa0JBRGptZ2ZJd0ZJWnNKQVNo?=
 =?utf-8?B?SU1aTTJkNjNZNXB3QkVac0dqUUpGWDJuTE9oclc4NEZka2hpeVFrNzd4YUZD?=
 =?utf-8?B?WUMyY0pXR0tGWmp6ZjJ1S3c3eFB2emJZUlRUQTBiZGNIanppL0wvNVFHbXhJ?=
 =?utf-8?B?WGRyZmtIaWUzbzNURHZyNGZhb2lxUlVLVHNZMmpkVkVZUTNQVXo4WUhmM0wz?=
 =?utf-8?B?blg1dE9EWmh3N0lpVklHdk1nbHNwZVpHQnVJczQ4WE9NY3gvRlFPS3BvQ2R3?=
 =?utf-8?B?Uk1sOThwUEN1WGpmc25iM0ZTaUJPUXhZWFhFSjFDRDFMOVBLNmxyN0tod3JI?=
 =?utf-8?B?NjJIcERYSGhEQnNGcldXYnJkVEx0a01nb241SFF2N1N6dVdhV2NWUkx0NWYr?=
 =?utf-8?B?c213VjZHWXZST2VqN2dHUWU2dzBYcU0vdGZBQlVyQUlTekQ3M2V0ZTRNYk9r?=
 =?utf-8?B?cnZBdFNjOU1uamJ3NUNoK3dhUCtKT1QzM1BkVzBmZVJ5ei8xNjlWYk1EWG5j?=
 =?utf-8?B?YktZSnlKbEFIMHZSai8zK2VMMGJaYW9rdm5sZ01NeEUrR25JL0JveUd3S2pi?=
 =?utf-8?B?OFgzZi9scXEzdWx2Y1NoNVJUcS9kcDdKSmFSdWl1TjNIRFlqMkdlV3czenhi?=
 =?utf-8?B?OFN0Z1l1c09Za2lpL2ppQ05qVDhRcm4wcnFNNGs5RTlyLzk1bFZtb0NiMDJN?=
 =?utf-8?B?T1RRTUZTNW5WWFZ4Y08zSUU2MGdOaDA3WHFRN29mM1JvOSsyQkpnY0FDVmZ1?=
 =?utf-8?B?OXo1cE80Sm5nZzlxemU3Vkt2bzZhQVVHa3VXNVcyTSswQ29DUzhHL1Q1dVhr?=
 =?utf-8?B?UlJjUTlodUkybCtsSHh2L043UGE2TVB2bTV3aTRQdDlqa2M5Mk12NSs1cDhP?=
 =?utf-8?B?TisrbVlvN0Z1RVZkUmNDVERkQ1B1blF0WXFTM0dNeVVyRU1xYTZPb0RVYVJK?=
 =?utf-8?B?UWhUSU1OUkxHa1VUdFlBVW1La0VGK0gvd2VSZGdLUVNsZXZINGhwSFE5T1Zx?=
 =?utf-8?B?QkVkOHB3NDRFWHdVcU1MRTBkNWxKNXBjanhsRDBhbUVxSlRrUUxSdVhDYVds?=
 =?utf-8?B?UlNRSzNsczIyWTZxSHlSK29MeXp3SWJHSlFrd2dXVENtaS9tbkFsMmI4M1Vy?=
 =?utf-8?B?QnQwbzA3UlRNYjFXcHB3R2hHemYyU0M1SHZRR3M4dTdlNUZSOVplZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30c930fa-f11d-4e22-fd1b-08de4149ddd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 11:04:24.3307
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uUIe5PErFDJRckHhaMdrFkZg0Qzjv7mqk7NoHGz6J81r67XmH0T2FWMV0O0l7cqt8SlF0g622BeVcMywY3SlGupdypD2Fkr8RvlucOH4LTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10728

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjIgRGVjZW1iZXIg
MjAyNSAxMDo1OA0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IG1t
YzogcmVuZXNhcyxzZGhpOiBBZGQgbXV4LXN0YXRlcyBwcm9wZXJ0eQ0KPiANCj4gSGkgQmlqdSwN
Cj4gDQo+IE9uIE1vbiwgMSBEZWMgMjAyNSBhdCAxNDowMywgQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0t
DQo+ID4gPiBGcm9tOiBKb3N1YSBNYXllciA8am9zdWFAc29saWQtcnVuLmNvbT4gQWRkIG11eCBj
b250cm9sbGVyIHN1cHBvcnQNCj4gPiA+IGZvciB3aGVuIHNkaW8gbGluZXMgYXJlIG11eGVkIGJl
dHdlZW4gYSBob3N0IGFuZCBtdWx0aXBsZSBjYXJkcy4NCj4gPiA+DQo+ID4gPiBUaGVyZSBhcmUg
c2V2ZXJhbCBkZXZpY2VzIHN1cHBvcnRpbmcgYSBjaG9pY2Ugb2YgZU1NQyBvciBTRCBvbiBhDQo+
ID4gPiBzaW5nbGUgYm9hcmQgYnkgYm90aCBkaXAgc3dpdGNoIGFuZCBncGlvLCBlLmcuIFJlbmVz
YXMgUlovRzJMIFNNQVJDIFNvTSBhbmQgU29saWRSdW4gUlovRzJMIFNvTS4NCj4gPiA+DQo+ID4g
PiBJbi10cmVlIGR0cyBmb3IgdGhlIFJlbmVzYXMgYm9hcmRzIGN1cnJlbnRseSByZWx5IG9uIHBy
ZXByb2Nlc3Nvcg0KPiA+ID4gbWFjcm9zIHRvIGhvZyBncGlvcyBhbmQgZGVmaW5lIHRoZSBjYXJk
Lg0KPiA+ID4NCj4gPiA+IEJ5IGFkZGluZyBtdXgtc3RhdGVzIHByb3BlcnR5IHRvIHNkaW8gY29u
dHJvbGxlciBkZXNjcmlwdGlvbiwgYm9hcmRzDQo+ID4gPiBjYW4gY29ycmVjdGx5IGRlc2NyaWJl
IHRoZSBtdXggdGhhdCBhbHJlYWR5IGV4aXN0cyBpbiBoYXJkd2FyZSAtIGFuZA0KPiA+ID4gZHJp
dmVycyBjYW4gY29vcmRpbmF0ZSBiZXR3ZWVuIG11eCBzZWxlY3Rpb24gYW5kIHByb2JpbmcgZm9y
IGNhcmRzLg0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1YUBz
b2xpZC1ydW4uY29tPg0KPiANCj4gPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4gPiA+ICsrKyBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4gPiA+IEBAIC0xMDYs
NiArMTA2LDExIEBAIHByb3BlcnRpZXM6DQo+ID4gPiAgICBpb21tdXM6DQo+ID4gPiAgICAgIG1h
eEl0ZW1zOiAxDQo+ID4gPg0KPiA+ID4gKyAgbXV4LXN0YXRlczoNCj4gPiA+ICsgICAgZGVzY3Jp
cHRpb246DQo+ID4gPiArICAgICAgbXV4IGNvbnRyb2xsZXIgbm9kZSB0byByb3V0ZSB0aGUgU0RJ
TyBzaWduYWxzIGZyb20gU29DIHRvIGNhcmRzLg0KPiA+DQo+ID4gTWF5YmUgZGVzY3JpYmUgMCAt
IHN0YXRlIGZvciBTRCBhbmQgMSAtIHN0YXRlIGZvciBlTU1DID8/DQo+ID4NCj4gPiA+ICsgICAg
bWF4SXRlbXM6IDENCj4gPg0KPiA+ID4gKw0KPiA+ID4gICAgcG93ZXItZG9tYWluczoNCj4gPiA+
ICAgICAgbWF4SXRlbXM6IDENCj4gPiA+DQo+ID4gPiBAQCAtMjc1LDYgKzI4MCw3IEBAIGV4YW1w
bGVzOg0KPiA+ID4gICAgICAgICAgbWF4LWZyZXF1ZW5jeSA9IDwxOTUwMDAwMDA+Ow0KPiA+ID4g
ICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzkwX1BEX0FMV0FZU19PTj47DQo+
ID4gPiAgICAgICAgICByZXNldHMgPSA8JmNwZyAzMTQ+Ow0KPiA+ID4gKyAgICAgICAgbXV4LXN0
YXRlcyA9IDwmbXV4IDA+Ow0KPiA+DQo+ID4gT24gUi1DYXIgbW1jL3NkIG11eCBhdmFpbGFibGUg
b25seSBvbiBTRDIvU0QzLCBzbyBJIGd1ZXNzIHlvdSBwaWNrZWQgd3Jvbmcgbm9kZSBTRDA/Pw0K
PiANCj4gV2hhdCBkbyB5b3UgbWVhbiBieSB0aGlzIGNvbW1lbnQ/DQo+IEFGQUlVSSwgdGhpcyBt
dXhpbmcgaXMgYm9hcmQtc3BlY2lmaWMsIGFuZCBub3QgcmVsYXRlZCB0byB0aGUgb24tU29DIFNE
SEkgY29udHJvbGxlciBpbnN0YW5jZT8NCg0KQXMgcGVyIFJaL0cyTSBoYXJkd2FyZSBtYW51YWwo
Ui1DYXIgTTMtVykgU29DIGhhcyBtbWMvc2RoaSBzdXBwb3J0IG9ubHkgZm9yIFNEMiBhbmQgU0Qz
LiANClNEMCBhbmQgU0QxLCBTb0MgZG9uJ3QgcHJvdmlkZSAgOCBkYXRhIHBpbnMgdG8gc3VwcG9y
dCBNTUMgbW9kZS4NCg0KNTcuMS4yIEJsb2NrIERpYWdyYW0gbWVudGlvbnMgIk5vdGU6ICogTU1D
IGludGVyZmFjZSBpcyBvbmx5IENIMiBhbmQgQ0gzLiINCg0KQ2hlZXJzLA0KQmlqdQ0K

