Return-Path: <linux-renesas-soc+bounces-25464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6BC97C16
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 15:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3BA494E16E1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 14:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FE431813A;
	Mon,  1 Dec 2025 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="grC7ztcd";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="grC7ztcd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021140.outbound.protection.outlook.com [52.101.65.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2B2AE70;
	Mon,  1 Dec 2025 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.140
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764597652; cv=fail; b=RdK82jUJNapPeZHtTdPc0U2ESURFI0t9E49IcLR2nlkORKj8q5C8tVGAhr4JanpX4Ao6SwBAhsBchsJXMNe+qyX9t4M9qd9X+CqZGh/vdaR4XsznIipMWjNISk0BmFhAidG4qP9mcjMvWazbh/YegPLu+rSpRo0fbH/FHWw5NmQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764597652; c=relaxed/simple;
	bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t+8zf7dbAdAxUDCBlrMIM2w6MGdG5RLBjOClKODNZ3jCnbT1TKBZK5WWhtFyiICDaFCRGqujM/56I2dRpk2QSiniFB7o64svmXOFCq2I0Rd+YoZMdFxDBe7tO5fmkH67F1rw4ht+lgraO2jaNgcm5aYOB2aVDG3lGYZQxioRaYg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=grC7ztcd; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=grC7ztcd; arc=fail smtp.client-ip=52.101.65.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dVpYKIFWNnVHzEuPTo1DFzkz1AQimjrqu3qV+ALyNMJwTAyiZ6vysxOtaiKE1dKmN3KdkdoSXyynqW+kj4VcPeW08CXM/nzgUOgYBUuQgh/9k9CUFCEdydNTi2FoSVIBiJpoj8pk6hxIZd3e5Bq81g5E7JcHzf5Jr1QZ1g3w1pNXjoqRbe4DfV5z2d/340RABcnvaqzP4HiDI7Ogiow/ftz7RTYDkRjNzvl3f2Cl/iIHFN2Q5WAWO+9jKhSvdFAOHoeHE3ohvWaSGqVuIBtqEI08vypjw5MJOASKv7xWj5CsJ/AnzJ3hjaGwo0jW0s3/Z24Uq8PEh/cS5hYgaTAybA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
 b=miC5WMKPB1+M0Ku8bXbQNwWRSYz5D9Pc4LZh8vFqLUOOwEXvGajIqHUB0FHfuSMtVEVJGVyRda1jrHv0skqa03adCirWpOYiu33a2qSnIGc9kT3jE/MRwazJerPtZEuoR+B9k/B7ToSAHlHuS5LpmeJoAuqovsruoYTvmhBHuUGxJs9pKkuDVNGiUc24dG/9uKqE71biOMNIMyoyx5xC+hZtx6ChoqSYA+mVj0VEb3DPwBpnejerwLXNKBWDBbPBgarAB/D4wI8I/qslaNNRUVL64BiJbqep1veD7tUsUBLXUCADA8PXAocY7M5QF89+t4W2ZpfyCKdxtOih0FGCqw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bp.renesas.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
 b=grC7ztcdDFJE3L4MII9iKDueWFDIrbivLceQWArMYQGLzEqiNecS+eqwsY3L73r1w+cMXD17knWYSxS4RDmBua3YDOHKyoeLvVz/4L3Q8rHfklgsBgYf49P16Cp09G1OeO31myFBcfBYR/llMyh81+eoe+XCg0sEYZ4vvVHE22w=
Received: from DU2PR04CA0260.eurprd04.prod.outlook.com (2603:10a6:10:28e::25)
 by AS8PR04MB8580.eurprd04.prod.outlook.com (2603:10a6:20b:427::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:00:45 +0000
Received: from DU6PEPF0000A7DD.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::a4) by DU2PR04CA0260.outlook.office365.com
 (2603:10a6:10:28e::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 14:00:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000A7DD.mail.protection.outlook.com (10.167.8.37) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8 via
 Frontend Transport; Mon, 1 Dec 2025 14:00:44 +0000
Received: from emails-6081927-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2563E80170;
	Mon,  1 Dec 2025 14:00:44 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764597644; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
 b=KrX8uUzuRgSSJvVoYI2XsHd22pG1z3IZ4xkPXc1T4Z0mKs8iD2zKhyBOX45MaTMp+bV2G
 e6N5UvxzwaZRQ15ZOiEUfEeCQ2s51M7QnoQ+liIQPBOgGHFGcH/podbB7cakegEmR4dXLuM
 FhmEbNgwynSwp51E0oWwkIEQxjE2Y78=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764597644;
 b=egCyuAyiR3OdGrCeo45IArLl3XMDG/KL3cNLIET86WffufewIE0PFSw66pAyiBmOaD1BD
 wCYA84mIaQQUcvJU4fBDcgAWK0voJYsamPXbQW8nHeDtfPDST1ge9XjZjIvaUO+NpFYgW79
 leioV6biNbocuMFde/o299eRQoUa1Fs=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0Vs0cao9xhvUFQPTsFSo+5w4OCBtFwX1hxUFgCjRdBihRkFFzNgwRl/4Ohgl/8PvTaMPMf18rFtgMiyyy/KPWUUJtzWoutOgvpNtwttTE7wtKLhSlnXd6FIWq5WmBjij0qVFJAn85V2eqp9gdXn9VdT1/aW6r3NaoydE8fHwCfk3lAljTfSMRdsylF6K+0ECRxO15XUvMuNcxTSYmp/fbjyKUsciYhHdBnpSAu2miYkoAu9cc279y4igXCAX5pbIgeGsu6Bj4nrFymtrkdNWrubsmD1JkO3THx+g992A9uSz0LKB8OVZLB7LsMcJqB9srryIcegr+sUKUvEtifDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
 b=ZcK6LjEoMLDfVsXL7OdMPU/zxYyUwgPmnXm9AArGHXhCKd+ianSrTk7fDeFB19H5hXsTDwMFfkYUbLPx49XdOF886B4WagVFGNu9CAQvOXH+6nHR40OiOdS3X6WLwGfMRKF8DxZchyskL8e9RxL4XsfZFJ61YlPsBOry9F5fvuLaKwTJljZ6Otk8AG7TU7dhTNvSJls4FMVjhcHEfmtnvQGi1RYYH12QaeeJhIZ+JOwA+ntTa+CNsn4ERWsCZpi278c1qFGQKgMKF/sW7klFcTMbbFAFDKLyz/QH20UIl/ptGPDlXX6oSPrQ+qBW7IdrHenvNo+I4qT++o80Ovw+PQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhTHgsTuopK8XUXmqyuYLbam5ePbFFndJpHICaixgV8=;
 b=grC7ztcdDFJE3L4MII9iKDueWFDIrbivLceQWArMYQGLzEqiNecS+eqwsY3L73r1w+cMXD17knWYSxS4RDmBua3YDOHKyoeLvVz/4L3Q8rHfklgsBgYf49P16Cp09G1OeO31myFBcfBYR/llMyh81+eoe+XCg0sEYZ4vvVHE22w=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB8089.eurprd04.prod.outlook.com (2603:10a6:10:247::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 14:00:33 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 14:00:32 +0000
From: Josua Mayer <josua@solid-run.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady
	<yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Topic: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Thread-Index: AQHcYr5ivKGW5aRMFEW96j1IOm16C7UMwB0AgAAQHQA=
Date: Mon, 1 Dec 2025 14:00:32 +0000
Message-ID: <7322ce79-4684-4a3e-9637-824b4398b51a@solid-run.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
 <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
 <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB113465581E5F8BD6C45FB7DCB86DBA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB8089:EE_|DU6PEPF0000A7DD:EE_|AS8PR04MB8580:EE_
X-MS-Office365-Filtering-Correlation-Id: bc6bac24-db6e-4292-f3b3-08de30e205bd
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WlFrMFJsMmoxOFRDSzNzbUFCZWR2cmQ5anR6K3haMGNxblQzMFo4TVBIZHBT?=
 =?utf-8?B?V2dXMGhVeUhqVGRyYk5HZFI2dFBTd2VHUDVXV3YxTWJuQThWY0s0YTJaUXFZ?=
 =?utf-8?B?dmRGc0I2NjRxeVk2QURqK05YTG8rWVhlc255ZDJpZ2RhUnF4bnh3ZVFCWDlh?=
 =?utf-8?B?MzdaazZ6MnZ5TEVlTEdQUXRObGd0d2RvL1IyaHU3ZGtWVkhNaWtCSDhsMUtN?=
 =?utf-8?B?b1YrMHp0NEVZSlF2cjRZMWsyeS9oQTF3ZFlONjMxZlFEWVdnQ0ljamZyUHcx?=
 =?utf-8?B?L2loYVFPK2tCRVl4dWI3WVpLN2U4aHBNN2lIS1RuODBMVWl2MDN1bWY2b2M0?=
 =?utf-8?B?RFR1MW4zMnNkNkJ6SkovejZ1SnprR3VyQ0VVYW5ubkFrd2piMGlVZUJDd1Nv?=
 =?utf-8?B?NFNCbDJJcHU4ak8vK1BPVVJoSnF3eGF6VHB4S3RLc1BLMWlnSzNTWTBCcnp1?=
 =?utf-8?B?aUYxNXFrV1hvQU5ubjFlRkpDU0Uxby83aFVWeHhHVDVCbFd5bDZ1clVuSHZ1?=
 =?utf-8?B?RnJPaUVna1FsMFRQNExKV1h5dWw3M1RQWGdpUitZUnpqc01LZ1JLMEhua0NP?=
 =?utf-8?B?cm1GTUR5N05CV1d4WDJQSzFkL1YweC96bEVmeXFieHdvaEVkU0tIRGI4UHdZ?=
 =?utf-8?B?S1ErdU1aVURQNmJ2WXdmMVZBcGxneG1WcnJtWnFybG1tNkNmcW5sWTZWNXk2?=
 =?utf-8?B?WWVNWHMyYWdBc1RTMTFiQmpYdzBJeFR4MzlmS3RGSy85MGNWMmJINWIxLzlD?=
 =?utf-8?B?Z1RoaDUyQmovbWU5dGVjOERWSFFVYnV4ZjBobFJYSFFvaTA1ZytlRXhIWDFD?=
 =?utf-8?B?WHZ4WmtpUHJEMUdmTkdGSEV6QVBMWksrVDhCU1Nja2hTbm5nSTdIczArQUhn?=
 =?utf-8?B?RzB2REcxby9oRFJVRWo2amxIU25OOUx4alhnRjJLdEJ5d2ZtUm1CY3lRYS9P?=
 =?utf-8?B?N1lqcllwamRQdXFZSEpFZDFyRVhEZk8xZDNFUk1CTlJQSERDU3N4NHg4dHF6?=
 =?utf-8?B?Y1Z0RXZIbVdVVFA5Q1prQi9USCtvZ3NaaDgwa05ENnZSVk1WYzFJREUxUXhN?=
 =?utf-8?B?Z1ZHalBiRXNXWldJYW5RWG9Ybm93MjdobzBRa01xNTJUS3VLQ3pTUjJLeTBi?=
 =?utf-8?B?aDMzRXVNZDBZQm9vK20zaGliTytBV1ZkaVc5OFZJVGVtTTA4VEVLaU5vVXpx?=
 =?utf-8?B?NEdienE2MGltVlZtRXpNTEgzaUtrN1p6MjFpYTBFK2k4d0QvbmNaOGphOHZv?=
 =?utf-8?B?Zjd6NTJxZnp0djB2MHI1ZUVqYzhQTERTODNUZW9jd1VsRnNGd1daRlVSaGxz?=
 =?utf-8?B?NmlLMndaOUNkQ1U5YmtpdWlvZTJpNGFFVWpscmtJWTErOVJLRCsyQmlsVFR4?=
 =?utf-8?B?Zm0vb1dGci9aTitRN0JON1M2MUE4MTFaTlpEUUZOWm1pbGhuTXRLYXpFOGt6?=
 =?utf-8?B?aDlVdkI5cEZ1bTJIRU1oNXpwQlE3OVUweUtSMitZY1cvZCs5anQyYUdyMHlO?=
 =?utf-8?B?UjVib2xDOXlhakw4YUJOT1ZZSnVNSDY5SG1mMFptVlhFa0JERmJ4SmplQzJ3?=
 =?utf-8?B?NjgwcG5oUkN1UzNOUHR5Y1pBU2pPK2FiTjk2Ymg5ZzBjWmJtdzZTVGt2NXZ5?=
 =?utf-8?B?M1pZc3h5RFl3eEpSRG45QXdsRlNleERxbnlUWTl6NUJJOExCNWIzbUtjSEJr?=
 =?utf-8?B?bFVWcStBRVZ3djBYRlh5Q0E5MUtPZ0VxTUtjWTBBQ01TL0R2S0xhQmk1anJI?=
 =?utf-8?B?bklxUzllelhnZm9vY2k3VGUwb0lLSHdZQlZUcUx5VUoxME9aR3J2NUVQS3Bt?=
 =?utf-8?B?TnlCc3Y3RFZGVFVSWUwybnBtbnlKb1NiSkNMWGFtTGMxanU2eHRwTWlBOHBx?=
 =?utf-8?B?UnBNa0Y5UFVwanZJa0tpNDVWNXdoSUlJSkRGZzJNU3daY3VmTUNMVXduak1K?=
 =?utf-8?B?VEUwRWNKRktCeHp5ZUVSV2VBTkFHcTN3bEVKNWNEdU4zU3QvVlFDVGVFdGIr?=
 =?utf-8?B?TTRFNlJxZUJyUEloMGNtR2Rmc1d4aGNvTzBFdXN0SFlHcEF1dFdMeUt1RDdn?=
 =?utf-8?Q?zrHtEj?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <DF353E9C097A9D4AA4DCA2CB85A345DC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8089
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f2dab7030fc4435e9dc8ce770adda904:solidrun,office365_emails,sent,inline:a16b318bcca0cf807b7ab5a932f15c74
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba5fc808-462e-48e6-19ff-08de30e1fe7d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|1800799024|376014|35042699022|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjBGVVZ1amZ6UmxYMFNXbDN1alFmRUMrZGlGMmdxZktGeTk3QWI3MkFSVmNj?=
 =?utf-8?B?M3k0RmdHbTRlY3huc0tFRDRvNzlSb3lKOTkzZTd6NzgranlxT2VpeEMvNllG?=
 =?utf-8?B?NEdwTlN1KzBGdzFuNW4ycVlDbTh3Wms4Y21rUzF1ZDU5dWwwQy9DcFdseEZV?=
 =?utf-8?B?WE5zR0FCMFFDQyt3dEtFZDg1NFVWQnJCTTBERzlGZkNCd0RrWFpjREQ4aXZH?=
 =?utf-8?B?NTFVbEVMRlVRSUx6aVhzUDJFMWRxdkl4eUwvSUgwNno5S21vN0dPQ1pUSVNO?=
 =?utf-8?B?MDdxOG1ZZFVKTyt1cE9QbllmUEVwbHN3SVFUdk9kUFgrY2dGaExNUWJYbmMz?=
 =?utf-8?B?TjRBS3YzcmF0YlRka2tEdlBCRE5tVmo5NXBkbTNES21PUUxMWTFTeW0xWlRH?=
 =?utf-8?B?czVXcVBMZkcvMkRMdHc3UDRIN0pNVDV3MjBLRjBwUjlqVXVpUnlyMi9BTWFQ?=
 =?utf-8?B?UHVHYnhXcy9ldTQ5TGRmeGttV0tvRDRaeTZ6d0Jrd1lFaFIyQ0Y2WnBuNzNS?=
 =?utf-8?B?K2I4dFcvOEN2L3FPVlpIN2oyeEdyQjUvZmdDOUdORWlad1gwdUgwZVdTME9E?=
 =?utf-8?B?Y1dsdzdlSzNVdUFzQlU0ZVA5R3JvQnB0YUZzeGpiRS9ySmN1b3FYYWsvSStL?=
 =?utf-8?B?ZVpmbk83KzlnKzUydTl0NEZyckJYd0VyMGtBZVBObGZJZjhQWEZaVDd5RjJB?=
 =?utf-8?B?TFBuczIrcGE0Z0V4U2xVZVpWUXB6YmlxQ1Q1RVE4dGpTNlV4K3RaUFdEZzRE?=
 =?utf-8?B?c3FYU3VOeHRxVU1GQ0JXcUFKSGFKZUFGTTdxQVoxcmxWNUpPRVlwbkJOcWlM?=
 =?utf-8?B?TUhuRUNQWDUwVTBTdzZvUWJsWTVQK2VrcGI5OU9JY2FMdzNheE80ZGlFcjRD?=
 =?utf-8?B?QkwzcFAzTDNGalovd1YzTWNlOHVPQWNRTVhSOE9aYVV4R3ZVSHh5VlZPVDdC?=
 =?utf-8?B?SjhodkRKRkdDMDFLV2JrVGtHUlo2ejNVQklCbEhnbGNMQmJneUdST0t0TzRl?=
 =?utf-8?B?ZnE2R0VlVVJwSVdrcVJCZ2tCSzh6RkFzQllONk5mL0J4MUtqSzkzRGUwUXla?=
 =?utf-8?B?VnNjYVpveGlXcjhTMTEva2JzT3VCUVlDMmMyUUZ3c1dPcHM5QkYrZnN6RzQ5?=
 =?utf-8?B?NjhFTEVqUWpiQWF3bkF6T3pkVU45eGRTNzJhNys0N2ppQ2NSWkJjZjRIbG45?=
 =?utf-8?B?alNBVXFERW5oMnhkQW1QL2RGU1dxVUZmUkYwZVhNbmQvOWRYZ1I1MWRScG93?=
 =?utf-8?B?QWFxcUU4OWRmbXV2TjNOZzNDb3YzVXJLR0VDTkMzU09USUdKbjczbTc4Wk9V?=
 =?utf-8?B?NlN3cTJQVHAraWx4Y01veTFkb3ZoRHBrKzFpZXorUnU5anRwVmMxSjU0cHdY?=
 =?utf-8?B?eGdkMldOS0c3ejRxOHh5czRXZ3Y3S0laQ2VraUphZHdoYkI1WGRRb0k3S3M1?=
 =?utf-8?B?Tk1vbzd1OG51WitnQncxMlFxWWdueXlRTm81RDUvRjZXYzFwQUdKcVpDeTlp?=
 =?utf-8?B?d1VRSnhsSkdKMjQ0QmVxZVZOWnpmbTZXOHFONFVqZkY0OGVoSE9VaDFJSDdv?=
 =?utf-8?B?OGZtNFYxNmRXRGxsdy9Kczc3cHc0aFVxNjUrTXdYYm9NdjluSWpPU29qd2lY?=
 =?utf-8?B?Z3M5QkhsL3llMjVVcGNNbHFFL2xvWkp1NE44V2xzSklGc0poc21yRVZpY1Fi?=
 =?utf-8?B?eXRRL2JhdnAvOFQ2YzZOU1JqMlljVXpaWW9iRHZja3V3OEZqWWlUS1hWbW1a?=
 =?utf-8?B?UVhDb01DTWppV3YyZkpTK2dhN0IzQU1xekdWaUh1ZGJGUUdjbFNSbXo1cm9E?=
 =?utf-8?B?UEt4V1dlTHNvaFJtWHVOd2JqMGtCNW1pNW9BL2ZFUTBxRjNWMlhRa0JZVkd3?=
 =?utf-8?B?c0wyS3pUdUYrcTVVZmpsNnFsZzNVVk1NQzJQN3pibk94QTRZVHZkOVVBVk12?=
 =?utf-8?B?SGMxL3FwZ2NiSW5DejlUaWZpaVgxQ0NXQXlRaXloRjh1c0hDNFYwVGlhb3RQ?=
 =?utf-8?B?NW92VmM0T2lYaFVPajc1RnJIT2p5eGgyV0xkRDRvZHdiZ0NmdThxRE1IeUpj?=
 =?utf-8?B?RGdMS3ZhN0hZb3hyREsvUlJzVFhsTXlvN3IwVU91SXdCSEFqejY0WGprMXRP?=
 =?utf-8?Q?w9sw=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(1800799024)(376014)(35042699022)(7416014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 14:00:44.6519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc6bac24-db6e-4292-f3b3-08de30e205bd
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7DD.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8580

SGkgQmlqdSwNCg0KQW0gMDEuMTIuMjUgdW0gMTQ6MDIgc2NocmllYiBCaWp1IERhczoNCj4gSGkg
Sm9zdWEgTWF5ZXIsDQo+DQo+DQo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KPg0KPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEpvc3VhIE1heWVyIDxqb3N1YUBzb2xpZC1y
dW4uY29tPg0KPj4gU2VudDogMDEgRGVjZW1iZXIgMjAyNSAxMjozMQ0KPj4gU3ViamVjdDogW1BB
VENIIHYyIDEvMl0gZHQtYmluZGluZ3M6IG1tYzogcmVuZXNhcyxzZGhpOiBBZGQgbXV4LXN0YXRl
cyBwcm9wZXJ0eQ0KPj4NCj4+IEFkZCBtdXggY29udHJvbGxlciBzdXBwb3J0IGZvciB3aGVuIHNk
aW8gbGluZXMgYXJlIG11eGVkIGJldHdlZW4gYSBob3N0IGFuZCBtdWx0aXBsZSBjYXJkcy4NCj4+
DQo+PiBUaGVyZSBhcmUgc2V2ZXJhbCBkZXZpY2VzIHN1cHBvcnRpbmcgYSBjaG9pY2Ugb2YgZU1N
QyBvciBTRCBvbiBhIHNpbmdsZSBib2FyZCBieSBib3RoIGRpcCBzd2l0Y2ggYW5kDQo+PiBncGlv
LCBlLmcuIFJlbmVzYXMgUlovRzJMIFNNQVJDIFNvTSBhbmQgU29saWRSdW4gUlovRzJMIFNvTS4N
Cj4+DQo+PiBJbi10cmVlIGR0cyBmb3IgdGhlIFJlbmVzYXMgYm9hcmRzIGN1cnJlbnRseSByZWx5
IG9uIHByZXByb2Nlc3NvciBtYWNyb3MgdG8gaG9nIGdwaW9zIGFuZCBkZWZpbmUgdGhlDQo+PiBj
YXJkLg0KPj4NCj4+IEJ5IGFkZGluZyBtdXgtc3RhdGVzIHByb3BlcnR5IHRvIHNkaW8gY29udHJv
bGxlciBkZXNjcmlwdGlvbiwgYm9hcmRzIGNhbiBjb3JyZWN0bHkgZGVzY3JpYmUgdGhlIG11eA0K
Pj4gdGhhdCBhbHJlYWR5IGV4aXN0cyBpbiBoYXJkd2FyZSAtIGFuZCBkcml2ZXJzIGNhbiBjb29y
ZGluYXRlIGJldHdlZW4gbXV4IHNlbGVjdGlvbiBhbmQgcHJvYmluZyBmb3INCj4+IGNhcmRzLg0K
Pj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlkLXJ1bi5jb20+DQo+PiAt
LS0NCj4+ICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbW1jL3JlbmVzYXMsc2Ro
aS55YW1sIHwgNiArKysrKysNCj4+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+
Pg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tbWMv
cmVuZXNhcyxzZGhpLnlhbWwNCj4+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L21tYy9yZW5lc2FzLHNkaGkueWFtbA0KPj4gaW5kZXggYzc1NGVhNzFmNTFmNy4uNzU0Y2NiMWMz
MGVmYiAxMDA2NDQNCj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
bWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9tbWMvcmVuZXNhcyxzZGhpLnlhbWwNCj4+IEBAIC0xMDYsNiArMTA2LDExIEBAIHBy
b3BlcnRpZXM6DQo+PiAgICBpb21tdXM6DQo+PiAgICAgIG1heEl0ZW1zOiAxDQo+Pg0KPj4gKyAg
bXV4LXN0YXRlczoNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgbXV4IGNvbnRyb2xs
ZXIgbm9kZSB0byByb3V0ZSB0aGUgU0RJTyBzaWduYWxzIGZyb20gU29DIHRvIGNhcmRzLg0KPiBN
YXliZSBkZXNjcmliZSAwIC0gc3RhdGUgZm9yIFNEIGFuZCAxIC0gc3RhdGUgZm9yIGVNTUMgPz8N
ClRoZSBzdGF0ZS1tbWMtc2QgbWFwcGluZyBkZXBlbmRzIG9uIHRoZSB3aXJpbmcgYW5kIGRlc2Ny
aXB0aW9uDQpvZiB0aGUgbXV4LCBzbyB3ZSBjYW5ub3QgZGlmZmVyZW50aWF0ZSBpbiB0aGUgbXV4
LXN0YXRlcyBwcm9wZXJ0eS4NCg0KVGhlIGlkZWEgaXMgdGhhdCB3aGF0ZXZlciBudW1lcmljIGFy
Z3VtZW50IHlvdSBhZGQgdG8gdGhlIHBoYW5kbGUNCndpbGwgc2VsZWN0IGEgcGFydGljdWxhciBz
dGF0ZSBmb3IgdGhlIG11eC4NClRoZSByZXN0IG9mIGR0IHByb3BlcnRpZXMgbXVzdCBzdGlsbCBi
ZSBzcGVjaWZpYyB0byBTRCBvciBlTU1DLCBlLmcuOg0KDQomc2RoaTAgew0KwqAgwqAgcGluY3Ry
bC0wID0gPCZzZGhpMF9waW5zPiwgPCZzZGhpMF9jZF9waW5zPjsNCsKgIMKgIHBpbmN0cmwtMSA9
IDwmc2RoaTBfdWhzX3BpbnM+LCA8JnNkaGkwX2NkX3BpbnM+Ow0KwqAgwqAgcGluY3RybC1uYW1l
cyA9ICJkZWZhdWx0IiwgInN0YXRlX3VocyI7DQrCoCDCoCB2bW1jLXN1cHBseSA9IDwmdm1tYz47
DQrCoCDCoCB2cW1tYy1zdXBwbHkgPSA8JnJlZ19wbWljX2xkbzE+Ow0KwqAgwqAgYnVzLXdpZHRo
ID0gPDQ+Ow0KwqAgwqAgc2QtdWhzLXNkcjUwOw0KwqAgwqAgc2QtdWhzLXNkcjEwNDsNCsKgIMKg
IGZ1bGwtcHdyLWN5Y2xlOw0KwqAgwqAgbXV4LXN0YXRlcyA9IDwmc2RoaTBfbXV4IDE+Ow0KwqAg
wqAgc3RhdHVzID0gIm9rYXkiOw0KfTsNCg0KPg0KPg0KPj4gKyAgICBtYXhJdGVtczogMQ0KPj4g
Kw0KPj4gICAgcG93ZXItZG9tYWluczoNCj4+ICAgICAgbWF4SXRlbXM6IDENCj4+DQo+PiBAQCAt
Mjc1LDYgKzI4MCw3IEBAIGV4YW1wbGVzOg0KPj4gICAgICAgICAgbWF4LWZyZXF1ZW5jeSA9IDwx
OTUwMDAwMDA+Ow0KPj4gICAgICAgICAgcG93ZXItZG9tYWlucyA9IDwmc3lzYyBSOEE3NzkwX1BE
X0FMV0FZU19PTj47DQo+PiAgICAgICAgICByZXNldHMgPSA8JmNwZyAzMTQ+Ow0KPj4gKyAgICAg
ICAgbXV4LXN0YXRlcyA9IDwmbXV4IDA+Ow0KPiBPbiBSLUNhciBtbWMvc2QgbXV4IGF2YWlsYWJs
ZSBvbmx5IG9uIFNEMi9TRDMsIHNvIEkgZ3Vlc3MgeW91IHBpY2tlZCB3cm9uZyBub2RlIFNEMD8/
DQpBcyB0aGV5IHdlcmUgZXhhbXBsZXMgSSBkaWQgbm90IGdpdmUgaXQgbXVjaCB0aG91Z2h0LA0K
V2UgY291bGQgZXZlbiBvbWl0IG11eC1zdGF0ZXMgZnJvbSBleGFtcGxlcyBjb21wbGV0ZWx5IHNp
bmNlIGl0IGlzIG9wdGlvbmFsLg0KPg0KPiBvciANCj4NCj4gQWRkIHNlcGFyYXRlIGV4YW1wbGUg
d2l0aCBSWi9HMkwsIGFzIHRoZSBib2FyZHMoUlovRzJMIFNNQVJDIEVWSykNCj4gdXNlIGdwaW8v
c3dpdGNoIChYT1IgZnVuY3Rpb24pIHRvIHNlbGVjdCB0aGUgZU1NQyBvciBTRCBzaWduYWxzPz8N
Cg0KSSBjYW4gaWYgc28gZGVzaXJlZCBhZGQgdmVyYm9zZSBleGFtcGxlIGZyb20gb3VyIG93biBH
MkwgYmFzZWQgYm9hcmQsIGUuZy46DQoNCnNkaGkwOiBtbWNAMTFjMDAwMDAgew0KwqAgwqAgY29t
cGF0aWJsZSA9ICJyZW5lc2FzLHNkaGktcjlhMDdnMDQ0IiwgInJlbmVzYXMscnpnMmwtc2RoaSI7
DQrCoCDCoCByZWcgPSA8MHgwIDB4MTFjMDAwMDAgMCAweDEwMDAwPjsNCsKgIMKgIGludGVycnVw
dHMgPSA8R0lDX1NQSSAxMDQgSVJRX1RZUEVfTEVWRUxfSElHSD4sDQrCoCDCoCDCoCDCoCDCoCDC
oCDCoDxHSUNfU1BJIDEwNSBJUlFfVFlQRV9MRVZFTF9ISUdIPjsNCsKgIMKgIGNsb2NrcyA9IDwm
Y3BnIENQR19NT0QgUjlBMDdHMDQ0X1NESEkwX0lNQ0xLPiwNCsKgIMKgIMKgIMKgIMKgPCZjcGcg
Q1BHX01PRCBSOUEwN0cwNDRfU0RISTBfQ0xLX0hTPiwNCsKgIMKgIMKgIMKgIMKgPCZjcGcgQ1BH
X01PRCBSOUEwN0cwNDRfU0RISTBfSU1DTEsyPiwNCsKgIMKgIMKgIMKgIMKgPCZjcGcgQ1BHX01P
RCBSOUEwN0cwNDRfU0RISTBfQUNMSz47DQrCoCDCoCBjbG9jay1uYW1lcyA9ICJjb3JlIiwgImNs
a2giLCAiY2QiLCAiYWNsayI7DQrCoCDCoCByZXNldHMgPSA8JmNwZyBSOUEwN0cwNDRfU0RISTBf
SVhSU1Q+Ow0KwqAgwqAgcG93ZXItZG9tYWlucyA9IDwmY3BnPjsNCsKgIMKgIHBpbmN0cmwtMCA9
IDwmc2RoaTBfcGlucz4sIDwmc2RoaTBfY2RfcGlucz47DQrCoCDCoCBwaW5jdHJsLTEgPSA8JnNk
aGkwX3Voc19waW5zPiwgPCZzZGhpMF9jZF9waW5zPjsNCsKgIMKgIHBpbmN0cmwtbmFtZXMgPSAi
ZGVmYXVsdCIsICJzdGF0ZV91aHMiOw0KwqAgwqAgdm1tYy1zdXBwbHkgPSA8JnZtbWM+Ow0KwqAg
wqAgdnFtbWMtc3VwcGx5ID0gPCZyZWdfcG1pY19sZG8xPjsNCsKgIMKgIGJ1cy13aWR0aCA9IDw0
PjsNCsKgIMKgIHNkLXVocy1zZHI1MDsNCsKgIMKgIHNkLXVocy1zZHIxMDQ7DQrCoCDCoCBmdWxs
LXB3ci1jeWNsZTsNCsKgIMKgIG11eC1zdGF0ZXMgPSA8JnNkaGkwX211eCAxPjsNCn07DQoNCkkg
ZG8gbm90IGJlbGlldmUgaG93ZXZlciB0aGF0IHRoaXMgaXMgYWRkaW5nIGFueSB2YWx1ZS4NCg==


