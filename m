Return-Path: <linux-renesas-soc+bounces-25438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DAAC97497
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 269C83443DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:32:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C194C30DD13;
	Mon,  1 Dec 2025 12:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f3VSM7ws";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="f3VSM7ws"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022122.outbound.protection.outlook.com [52.101.66.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F10130C622;
	Mon,  1 Dec 2025 12:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.122
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592293; cv=fail; b=FglJfSawhvs+DfBPt/AHSkvo6VB0ktISMF112leMozXwLIrRZEJrQgXV3OwQfsQEQFT8luPhPrTqGPTJTHN/DAaHwH8xUS+0RjjQx3a+v/lc6k+LL7DhD7eu95lHBDOkIBz8CnK+Of1+GCywVrHwCVe1G/vLb5t29koFKJ7p3Pg=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592293; c=relaxed/simple;
	bh=sCY+lTxnl7muccAx72L/7QOjIOOiCzogWH6M6w7T6Yg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u2BRDE2Mr9cE9Mo/fSa6EC/ZXmck43YEs+/z6ybtYI2zr98/mBEjTif6DmahVEG1ELQowM+12PBx1CLmk/p1InRfQccrDtP5CN+683+Ykpu7+DBjDLwUf5H62A8zh0eMJFK3Ci53ZtEpcjEbYZEKpQmuYknH20R2Ljy5WrfFPTg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f3VSM7ws; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=f3VSM7ws; arc=fail smtp.client-ip=52.101.66.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=uroByEo4ulZiTKgF6x7EYco9hzah4VyyBvXdwHIJ2oQ+zVgTk2GK6q67Bym6eUW8UhF9l3uUEMfZr2/hVLiEsxENiAoKWnAuy+Af8Z67YtUHepukeLAXBrpNmML2kVATom1CRIEufpzalJ+9a06kuZ9bRXxiKc2rwy4doLzKJ/c23eea353lZ3HxYJhNcoTCCcAkcgf7gJPfHbbG2pFrAm2NYsNZ0wdViMMTTvHgTZYjJeZgT3/V0OwNlMOXDkRuMEdvjooohFRwiz3Ldnd57WcA2FRyjZfXTiHrXIRYPK/A4avPRRtl6e1Xc7/viBl+DpOYP+VD0JA9IAfFrhXQHQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gyj3J29nUGVVwgFVBQuUyRhCDX9lxBM2H07rDzcJdU=;
 b=yeFEt6rskMXtMTYcdohCeo57SMQ5x2wYdYD2E0gYj9/9GcOTFPNUilA1/F3jnwBAp+EfbR/zii8OGTHPr+Wu6xvbuj2jPWBq0zzGJcVh4x7SJsfq8Og6x3jZMgV7uKEoh6R6f9s86n61Fn6ODJmdjHWcP61+LsCQ4Vqb506+xiBI6odCIXXaQ4PHglEp5j3eGv6omxknYynApDo+ci8THJyqyDxTJ5IDMV62g/1h6f7UMkeIbIow8Nazq4lhR2Q8eo2RMMA7qOHtvATjM+BaAnm2FEimpNlGxvNgIxgTbp49fwXVDmDlFOWD4e4kjx6xdmzuMbrwrBFbljO/fmXSIg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gyj3J29nUGVVwgFVBQuUyRhCDX9lxBM2H07rDzcJdU=;
 b=f3VSM7wsS9RrCnBE3tdHiKv9UMGek0a9nfw/kcRJl9F0J0Z3V6qgsCKDmhF1kKg6p9+5W3dWMwOGygYzTFoIGdWS/PLCIAJr/CNarL1x6PErmunBlERJ5iQTAY+Pn0iBPQai6ZAu4kCLKq8Xspat4i65hAhy0dvHy7fzQFsMVDc=
Received: from DUZP191CA0031.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::23)
 by GV2PR04MB11960.eurprd04.prod.outlook.com (2603:10a6:150:2f5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:26 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::3d) by DUZP191CA0031.outlook.office365.com
 (2603:10a6:10:4f8::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:31:18 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 12:31:25 +0000
Received: from emails-176431-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BC10E8011B;
	Mon,  1 Dec 2025 12:31:25 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764592285; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=2Gyj3J29nUGVVwgFVBQuUyRhCDX9lxBM2H07rDzcJdU=;
 b=NTsDMzjJcln3t5xwBKnbCd1QIDgbJ5VRZQmI7GoCmIgPkBIglCed0Sa6zk7pn+abU4uvV
 Do3IBdjZuAMZ/FQ19hlShheo+RXDs/cWG+tU0KhZrCh6rtSs4XSg5R3OTtpmwUvoodg2sjp
 Gj5ytNaSBh06VzhD2gOPnoS5IXgyECw=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764592285;
 b=a2hkFdhm0rSxrLXoFC0+gSOSexc62W8CMGWtkzWuVeJNl4O5436rI+0GgEvvQfQhZJSYL
 8cYSYaX2AQDea32EqAO/gThi56LsxR6MIfkERp4cuZmrhFktkASlJQ6RI2EYYwXIQCjBQPd
 Ow+N1zYHibQCRdUWWoBeX56QKDAW93U=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a27fK9LN/KD6DVLm6eBTRwlqoL9siRsoubp+ZOxSxthgacH/saTcTJrd5luPffqXNJXFPZQa4gGb7exZ5WzDJVpGQiS3NDdccQAy3yo2M45osrKJK/RDybJL6FJgkMCaULXBQ9KW4ff9+b6IpVzvzN3MWIXoFOhU1oFS9P0dJ/olU/lUyPkTWqoPmAScQdutanNAKQF91CjYHrl3tppyTeiHvXyqioTrrvJ70+Mqtxh+l9wFHq8qPE0PzfQnxd2O2XWdJE8oRkz8PA+ZrrJlbC8okkiURE5p6KoJpBg0eYvDRSQZmLg+CAin6PjfrhBKx+fB4wbn/vCX6y32NgkAJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Gyj3J29nUGVVwgFVBQuUyRhCDX9lxBM2H07rDzcJdU=;
 b=yRFKaO0rdvNoyUR9WSyR632QaYE5C250cF/4E/xXwj7Xzy20iH4/xdoN2lVc47okXeQcf/kW35i1XQfhaKSfTUC6BakCC1dfKqhi4mKw5vHBH/lwzqVxji/UkuyRQ/9LxKpjJtlWHtDOxU/5hQxnsTOw8WM/IfbV/Wh94flaZD8U/p2aAHPHrw7CUJdGFF+4A5q8y/mmfYiyziH8Ch7sEQf2OVIMB6gNoM0nGeso4uvC4Zq0cWSm1HWUreamKAcUeAeNVUAW6pQRmbCzZelPgdm5cgoZ9ANPdgvHdBhzcopv87CuuCJdISIn3efmr43glfjAD6q+4y01jcTe5MjaSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Gyj3J29nUGVVwgFVBQuUyRhCDX9lxBM2H07rDzcJdU=;
 b=f3VSM7wsS9RrCnBE3tdHiKv9UMGek0a9nfw/kcRJl9F0J0Z3V6qgsCKDmhF1kKg6p9+5W3dWMwOGygYzTFoIGdWS/PLCIAJr/CNarL1x6PErmunBlERJ5iQTAY+Pn0iBPQai6ZAu4kCLKq8Xspat4i65hAhy0dvHy7fzQFsMVDc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GVXPR04MB10897.eurprd04.prod.outlook.com (2603:10a6:150:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:16 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:31:14 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 13:31:10 +0100
Subject: [PATCH v2 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-rz-sdio-mux-v2-1-bcb581b88dd7@solid-run.com>
References: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
In-Reply-To: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>,
 Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0438.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::16) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GVXPR04MB10897:EE_|DB1PEPF000509FF:EE_|GV2PR04MB11960:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b9af8a5-808f-49e8-b3ef-08de30d58b6c
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UG1IcVJiQyt6TTlwL3NFbDllNFZjZFVDazhtSm9TZ1RMc3dkT2NiZ25Xa3pS?=
 =?utf-8?B?VHR6QnU1UTFtSnFEb2ZTK0hYM1Bsbk11MlF4M2p1ODBzSWFXQnI5dU1SckZl?=
 =?utf-8?B?MDFDVlZRNklwZlJUNGlZM05xL0d0NVppL3lOcC9lUFh5ZkNCblpSaWVwbHdJ?=
 =?utf-8?B?Qkc3MStmb0VUS3lyVWFueW5oZmd2VG9aN3NhT0xydVM0MmhYcnh5S2V3Zk82?=
 =?utf-8?B?dXBTYlpNYzBlaHNHYU04QUNlWStDT29WUUc2UWxtR2l3NEFoVDB0cWxvSGpl?=
 =?utf-8?B?VFp5MlNyWkx4RXlKR0NtL2FPTWJYQjdQTGhMM1RqOE93UWZEUTVHZ2xQK3lJ?=
 =?utf-8?B?dVdaOUVNUHM2dzdYOHQ4YXV1ZGcramh4NDc2M1RUQnNmL1ZYelc4V05LdXhE?=
 =?utf-8?B?L0pCRE5jMWlUbUJIZmhkektCenRlNFdWTklkY0xBbU1NeUlCZDl2ZXQvd0I4?=
 =?utf-8?B?RUw3dnpaR0w1RjdJclFYd0lqd3J3YXdmTTlTN2lUdFQvRGdGVk5JbnRQUktJ?=
 =?utf-8?B?cDdWRTV6YWxUQ3R5NUE0OG5sbHBQbUEwWHYrN2F4eVhydWYxN2tRVEZWaU1J?=
 =?utf-8?B?T0dEWVZlUThtVkgrdXVHZVJCME5lTHF5Q0hPd0szNjM1SGhsRDFaZHRZa3BF?=
 =?utf-8?B?TXplMzRpRVZlZG41VkRyWmo2ZXEvTlhUdXd0dE53Vy9OQ1R3aFV5ZDROUFVP?=
 =?utf-8?B?T0RyMm5ZS3VmU1lLTEphWldHcnBvK3pwS2hZQXcwdzZYWXVzSUovcitEZzNr?=
 =?utf-8?B?SXBjMVRQNHFabXdQMng5OEN0OHdScTlncVRqdmt0N294eGdnYXRnK3B5YWEz?=
 =?utf-8?B?Y29aWDRJME5DM1RaZEVaMG0xRjgxWDREUEpmdkV6U2M3eHN4RkdFRmJtSFZW?=
 =?utf-8?B?WXcyQ2lCRzhxRm1PcXRMdktnWTVoeFhQZXlCcWJaTG43ZklZSURIWmhvM3FQ?=
 =?utf-8?B?am1Uc3ZWSzJpUWVJK0p2QlkxN0RjbmpXT2NRNVNkU0NlYlVTa3YrdVZLSzh4?=
 =?utf-8?B?bUlSczB2ODBzc0tCaFJWNlRsbXJ5dlRwQ29EOGFRelB5NWJsL0FWbEtReUtW?=
 =?utf-8?B?U1pnMVNONVNUY08yR2hQVklBUVZDL3Z2STZ4V0NxMkFKVHZWSFF1Z3UxcU9w?=
 =?utf-8?B?OVljNFBmOUFDRXRYLzdMN0dDRDQ0aFhUN1FjaUsweUQ5M0MvV3A1WmpuQ3dw?=
 =?utf-8?B?QmM2VDdYWUlkVm1xWGtoN3dXTFZlb3dzK0R0MjhQZDVkS004clF0QWtpUmgx?=
 =?utf-8?B?RnNOMHQyM1NkRW1HdkRpbmxTUGFHN1VZV1I0ZWxDa2s3ZjMzajVqZEVCZjhN?=
 =?utf-8?B?MkNDejVUZkRMSU5HdkdzUXZJMFpuUkttSHhTMTVOTko1WTZiVlhzV0RXMC8z?=
 =?utf-8?B?eFVhWjVHM3ZscGVPbjUwV0pwSEEzeXBnRWtjUkdGa1JlMHEyZ1RDKzcrSmdt?=
 =?utf-8?B?aURHbDhMT0tHRHZOUzdRZGc0Z2xSMlZXUEFTdGxKVkt3cFFWZXlra2hJTW1o?=
 =?utf-8?B?UGhBOEFod1orUWJDbDRnRDdyOXpjdDUrbG5yR0tjS1Q3SE5MdEJtUDRoZUh2?=
 =?utf-8?B?bEdONWNWSkFBKzFIL0Y0WTFOcWtxZ3dHSUtRRnNMS2hsTk9lOFFudDgvcm9C?=
 =?utf-8?B?UmlzNjd5eWlySnhoNVFiQXlZSWtCOHRxSTNFZnRXeldPTkVOT0dCcHFMRklR?=
 =?utf-8?B?aVlaVTZBazhIWFN5emVmTjFQOVFZMWhzYXl4eGxreVcvUFhLZjZaV0gycVJn?=
 =?utf-8?B?QUo1NjFuTzhCNk5MYlJzczVrb3BZTkRJRjJQUklwbUxzUFVjdXhWZkRvZHJF?=
 =?utf-8?B?OEEzQWRTaXAwSkhVdTJCVEkwdVVhVnZoZjRDaGNsZzcySDNjeDJTWDN4bURP?=
 =?utf-8?B?Zm5JZlBWVERja1JVbkdNYzJEVW9ZNEhlRnVCbHNaQnJaZmp5bVZJUjVneU9r?=
 =?utf-8?B?cDVxaVZWS0ZKWFF4RkZUQk5sRFZoNXE2aCt1eS9yV1NQbklKMkRHYnROUnQ2?=
 =?utf-8?B?V2lIaUNyTy9CUittblJDZkJNTENEK21Xc0syN0hwM25zNG5LOFdzVFBwTktq?=
 =?utf-8?Q?+fOmYl?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10897
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ad253a266b8b416fad145331099db5be:solidrun,office365_emails,sent,inline:b4e8d627bcf650b9ee44e40d3046b0a3
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	88990612-91d5-40e3-cc84-08de30d58479
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|14060799003|376014|1800799024|7416014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N2JudmRQR00xM1lWbytMKzZzNk5aMVh3azJEeWUvZ3RSVFpDb0QrWkNUeEQ0?=
 =?utf-8?B?blFMSnFodkN1VFNwWTFiUXVIUnhYSG9NOWJTRkgzdjh5OFJubFFnbVE0bVpU?=
 =?utf-8?B?b3dXbWwrdVJINlp3YUtXZFdqd3dQUlhJSW9wUHhWYk54RmtqR3h0KzJ1K01L?=
 =?utf-8?B?Y3gwTm9LWlMzc1IyT3dEN3JFQ0lsMk8vbWY4SC9SdmxyUjgwVFJYaXBUTzBx?=
 =?utf-8?B?T3hmc25SWGwzbUEzQWdiV3hHRStDNzV5ckxPaHhUU2dJSkJzZ3ltd1luSFZO?=
 =?utf-8?B?SWRSdzNndjhBNkdaaVdlaG9rRXhlTXlFbXZOR0RoZjFHOUtRNmxzRWY4cjJn?=
 =?utf-8?B?SjBrNlE4RHFiQk1oN3Q5a0praWhDTlpKNUpYcktJeU1KK09Jc0cwaS95Q3ZQ?=
 =?utf-8?B?L1VGcUliUlREMWpnNSt0Vy9yd1hxQ0QwZU1uY2k4VmdyUlZpYnZtcmp0NzNR?=
 =?utf-8?B?bG9WbHA4dmd3S0lUclZaRkhRUUJsMVljQ0NGZUo4MjhZdjVYQUxQN3FtR01R?=
 =?utf-8?B?a1c5TTNNdFlZcmd0QlpxMzhLVC93RzN4bFlwWkljS0dxVEdMc29JSS9vK284?=
 =?utf-8?B?YzIvY2huTVdrT2NPSUtoa1ZRRHlsZzQyV2RtMDl0N0NwWFd1L1A3bGlYN3Rl?=
 =?utf-8?B?TElUdHgzYzE3QXNFN2RqNGpZSmdQVlNRaGlHTmlzSmptZVMraHJobnBydXVv?=
 =?utf-8?B?WjlBRGN5WFAxQkRhbFZ6QVFHMDFmT2RJd0RmRGF4QmNMaWZ4akJUbTFMU1gy?=
 =?utf-8?B?RkNibWlybVlmQlV1SzZ6MU52cmRNSHVJSDVQMFVwZWE0aHMwRkNYVzZGV29C?=
 =?utf-8?B?QVB1aGtuMUdBMVdlS3p3My9BbXI3bFZtblBXOEk3Vkp2cmZsTlZhR01iMVp3?=
 =?utf-8?B?U2gwc3RVWkgvRzVkb1hUM21Da1NTSkw3RHorSVR0U3dxdUQySzhVV3dvL0Qx?=
 =?utf-8?B?MWI1ZFJYaDIwZWJqdWtJMkl0TTl3R3ZGbnJzQm1oRmg0Rit3d3duY0tuSXNQ?=
 =?utf-8?B?T2NUenYrcnlNc1BaZjNhckpEd01PNCtFMEFZWGRaZXVhelhaNVZKWFlSNmdl?=
 =?utf-8?B?NlczQUhzMUJIZ3FMblhjeFc2WGRBbTFGT3RoMGhIcHVPZE9HMjdCUWVCbE5p?=
 =?utf-8?B?ODMzdlMyUnJDTVlOcld1TW8zTk0zYWlubWRzOSt4YTlyMG1wWmFBUnJBbmI2?=
 =?utf-8?B?eEcyRElVKzg0QUtJTHBuQXh3aVZRenBYOGNsc2liRmcvTU5HcGMwVFN0Y1FH?=
 =?utf-8?B?T3d2L3pwRGh0R0pkTFZCNHdzOUJOL0ZIS05LSC9ObWdEMkhjSHVVQ2RNS3Fk?=
 =?utf-8?B?cGFvS0U0QTZKSWZKb2ZSUHJma3YwaDBxWHpMdTVYQk9UWCtxNHBxaFQrR0xu?=
 =?utf-8?B?d0ZKeldrYVUzenB2cTQ2ZkZNWVFFSk9vOWI3ZklLc24zSkxiaUswZlpnVkNz?=
 =?utf-8?B?ODdFTzZibmNOVkxKSzBqTVRPTmxXZlZlUGNCd21DUWRDbUg5VnlrQWt3Y0pM?=
 =?utf-8?B?VG8zYjVoNGxtK3FSNnhvWldXSGcwRS9mdVd3aVlTOEZVZFY0TkFXejUrSkUv?=
 =?utf-8?B?NDBXKytIVzlWMTZVZGxFR0ZqQXdWeGVWcVJrTlJ2ZGxLWVFOdGh1SDcrczU4?=
 =?utf-8?B?YWROTkJ4L01tZENqVUtFS2xSQ21CZnZJYXR2UWdpa1FROE96OHg4dFJkalBI?=
 =?utf-8?B?dHF1eEgxT3MzQzBoKzA2TDNHQVV4Q1VjVHc0NWVSMjg1Z3dNZ2dZR2Q0aWxY?=
 =?utf-8?B?UmRGRHhzbGtMZjg2ckFQSVRPUlN1R2V4UFdMTVZiNVdjb3RPZTJxaTNldStL?=
 =?utf-8?B?ZSsrT0x6c05lV2VVa2ZjbjFBM2w1MkRDNlR6SlJuMStJdTBOOEdZVlJGRy9E?=
 =?utf-8?B?ZldlZkZVQmhMblA4QWl4VTRlTUUzdGp0S3pzSFI5UHlDeWt0Z2VxMFVKYjRy?=
 =?utf-8?B?aW5TWktkbzV4c0VDa0ZEZUVIbTdXaWFGY3NJSmdkUk9kZHdSM2ZSWHZDcGxt?=
 =?utf-8?B?SXk5Z3ZhLysyTldVKzF4OG5Pd1BVUGFIRHk1T0dQRnV3OURZVnYwdTUwR0Zr?=
 =?utf-8?B?SWpQc2czeUxtNWdWY3hIdFlFZzVGNkE3TlZiM2l1R2I3REhIakJIZmZZV0NR?=
 =?utf-8?Q?RBvE=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(7416014)(35042699022)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:31:25.8071
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b9af8a5-808f-49e8-b3ef-08de30d58b6c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11960

Add mux controller support for when sdio lines are muxed between a host
and multiple cards.

There are several devices supporting a choice of eMMC or SD on a single
board by both dip switch and gpio, e.g. Renesas RZ/G2L SMARC SoM and
SolidRun RZ/G2L SoM.

In-tree dts for the Renesas boards currently rely on preprocessor macros
to hog gpios and define the card.

By adding mux-states property to sdio controller description, boards can
correctly describe the mux that already exists in hardware - and drivers
can coordinate between mux selection and probing for cards.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index c754ea71f51f7..754ccb1c30efb 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -106,6 +106,11 @@ properties:
   iommus:
     maxItems: 1
 
+  mux-states:
+    description:
+      mux controller node to route the SDIO signals from SoC to cards.
+    maxItems: 1
+
   power-domains:
     maxItems: 1
 
@@ -275,6 +280,7 @@ examples:
         max-frequency = <195000000>;
         power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
         resets = <&cpg 314>;
+        mux-states = <&mux 0>;
     };
 
     sdhi1: mmc@ee120000 {

-- 
2.51.0



