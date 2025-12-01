Return-Path: <linux-renesas-soc+bounces-25437-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EDAC9748E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CC6884E150D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3E630BBBB;
	Mon,  1 Dec 2025 12:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="b3EHGGn4";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="b3EHGGn4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023073.outbound.protection.outlook.com [40.107.162.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10916254B18;
	Mon,  1 Dec 2025 12:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.73
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592290; cv=fail; b=qDh4uD4aj+8Eb5TxO22ds3iT7CJtUJdrAPiC+cvUke1ADOwaGPl7XNgNjGYHaJ4I3UhuRR4oAhirFJATDRjIWSE71oMioJRq/AReYqUwX0hHF2e/BVXkuwSfo2fqaxyAnEswRF+j0sV1DdqmnGdaNKGBsW2kUwrJuwBiZoNo/uc=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592290; c=relaxed/simple;
	bh=bFgsNh064p0XU4lGkkcJnAWOxNlfc6IMsrmGa21Psso=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=o9lfUNqXrzauYd50otKw0SsIfWB7A1VwB+IHMYaD+nyrJF576BJlgkHmtaKr0BGWKOC3IkYb9y/p0puUf1BWcOwVtIp0OLSQlQkB1bNfXNTg+DCQpjG0AZM9LHrb1osNkg/Y42WzSgKsK7FwLkNwOAVuM7vTMzNynAGHODeHogo=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=b3EHGGn4; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=b3EHGGn4; arc=fail smtp.client-ip=40.107.162.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=O4QkDkJqJXWl5qo/VSI41a06puef1/eR2QrQ/VQZaS7bPlx4a8NExTbdEF/UntKMmZijIaA0CivI3vjznEr9xldEH8C8Tdeb1+O/xGuv3hbgcrdlng2aAwMzMdNifW+bxSwhJtte8iAB2XHAtVrFtTacAffjMttCxfmoZmANcBvW96xTlcBP3YpH1noaLne74tvBi0jLkQYN7y5dVRt1s1lLKL/sYDvjcQogD2tZjLcLsmTuj2VbvkEWoCe4gmgMCzG8PYPvY4XNT9C+hBXFZLbz6IH7kwnSMXXNkUtiBGPdheuOiY7Ujv+WXxhudXjGzTt8fOC8rS9C0UYCfHKW3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TnZSnzPYEZlXjIvK7KZIPwR8mift1BcO44NJUtVbe4=;
 b=bXGpKvrn6BM/bXNBH11URRlw1TzBA2OIRyqKtD9BG8MDK0QI/FpQ9AUYcegFVEgrJyrfDyJk9QwvG8Rl3XjidRvi8s4aF9zPEpl559TlemPeyHOfl7yzr1WbQp/4mCmnGO9dhT3xukDaJpHMLskLMySq2ppzaSnYOAXu+eSAdXsKWHDo3VjvBpROIj4OSr7YlZwzMjnJkUaFaBPQ0HgqVB14F52xVXq4qlM0h3sa5I0Eaz6MbZe/usmL/Q3QmkyfTIbcM6HseIaUnWaXT7tJwqUPSMI8En3eeapQgZn9ty9P6PYHM/ZwPKqcjZQAZ+9WgZepk4xnwSc9D4FfCWGYsg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TnZSnzPYEZlXjIvK7KZIPwR8mift1BcO44NJUtVbe4=;
 b=b3EHGGn43fGpK9J0sU+yjJHEb1RYNTR+BQRGCTaGmOn/hQr5eGIiFy5VmXvEsEtMdkm9s67HxZ+wS+AOs8mM3rt+KiJuJ07vpZodmWunL0rOzkYWyk6gMYghWaYeCwOnwfekJl7dOkSmqAVpjs36r+LAp7dXJe+qmh1CiY7ljKI=
Received: from AM8P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::9)
 by VI0PR04MB10461.eurprd04.prod.outlook.com (2603:10a6:800:216::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:24 +0000
Received: from AM2PEPF0001C711.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::e6) by AM8P190CA0004.outlook.office365.com
 (2603:10a6:20b:219::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 12:31:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C711.mail.protection.outlook.com (10.167.16.181) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 12:31:23 +0000
Received: from emails-3968699-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-191.eu-west-1.compute.internal [10.20.5.191])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6FA2E8013C;
	Mon,  1 Dec 2025 12:31:23 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764592283; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=3TnZSnzPYEZlXjIvK7KZIPwR8mift1BcO44NJUtVbe4=;
 b=FZ7xsH9kNKTcelt133ohRhCRmNpNOCuwb8STioGNaZX0bBOVdloa2hwQiBlSRLqLE6lZe
 UpphyhI2Ye9mJ8Dsvdx+cWJwT1KUPVBxEn2hRi7GxN3ktkJLIpOzsysnP2k/vrKD+6/m5Sd
 qZaOxJGta9VMCPXQY70H/bIDea6NKgo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764592283;
 b=n1Y7licZK/iSx4EmEYVm9Xa5wDrTN8DofM2QxXKBSIi3/kYqu92lj98eVAXHPEHmU60DZ
 ZIONkVZh2AxMqHIj1XExGUBf5UIC5qaiJK4apH65ty7xsoHVGi0BrZ6iKUbFErd3+NynWyT
 nr6x6X0ljLov4+bXgkljaVIitHONhq0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmsHRcdzDDO/g8ang3PJ9KwGUumN9lw8o5iMeV6kyYIEMl67nJvvnQv20X5uLHVBz2ekeUGWaGjhPjj4BMHgU1XIJHS8og9UdintMs0U22Xjb1m5gEi+iOhd2NOFpGo50FbJ+xyMBusNCac+m4TgNM34IiFKbE/Q5crz4YPm/Sup4GWJVGoc0uN3kCLuCzTqBGVC4uGod9E/01rTocMBiZ5ucKVhQjezoVEca/joscjYoK25xpkCN8m3dbOr/SxDRTb6vXOkYTw4ub1N/5MDUPAWXpze9rExHjvREDnW/HXOUeecPtEiV4Wgb7s8typ+KG3P/XWOhpjcCjSnhaXkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3TnZSnzPYEZlXjIvK7KZIPwR8mift1BcO44NJUtVbe4=;
 b=MnltcLP7KNsj82QYxxr7CHN1VQO8dKdlNcdzFj2sM04lFqTwxfywSfPP3Eun1U4MupN8XWPxiDicUXJ8YHoQ5XyY4IJq1arsvnRsvTU1FpSQkZ/7EqXXLMdPWeM05sz5pEc1xhA8FtsLxeASFHwKykGU1C1/M2Rd5fzf2Uc4nRBu+nEXqZcQU6Zt4r9V8T/0afzzE00jVywZGMif77X8soyR20VQYlnhfvqpAvCK2mNdwsEptQNfaK8tU2ydjS3T4l5xlfjJGryOMZ8KUFI5bHgb76i/jeGrqUjcdoJg4p/Kn42/Eh1V6DnN8NzJgVL4woah58WlOmL6cROBJmR9RQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3TnZSnzPYEZlXjIvK7KZIPwR8mift1BcO44NJUtVbe4=;
 b=b3EHGGn43fGpK9J0sU+yjJHEb1RYNTR+BQRGCTaGmOn/hQr5eGIiFy5VmXvEsEtMdkm9s67HxZ+wS+AOs8mM3rt+KiJuJ07vpZodmWunL0rOzkYWyk6gMYghWaYeCwOnwfekJl7dOkSmqAVpjs36r+LAp7dXJe+qmh1CiY7ljKI=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU2PR04MB8614.eurprd04.prod.outlook.com (2603:10a6:10:2d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:13 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:31:13 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v2 0/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Date: Mon, 01 Dec 2025 13:31:09 +0100
Message-Id: <20251201-rz-sdio-mux-v2-0-bcb581b88dd7@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI2KLWkC/23MQQ6CMBCF4auQWTumUwI2rryHYUHaqUwirWmBo
 IS7W1m7/F/yvg0yJ+EM12qDxItkiaGEPlVghz48GMWVBq10Q6QNpg9mJxHHecXe2obqi6eWDJT
 HK7GX9dDuXelB8hTT+8AX+q3/nYVQIbHjmoyjVvlbjk9xmOZwtnGEbt/3L+8SaJqqAAAA
X-Change-ID: 20251128-rz-sdio-mux-acc5137f1618
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
	PAXPR04MB8749:EE_|DU2PR04MB8614:EE_|AM2PEPF0001C711:EE_|VI0PR04MB10461:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e297a6-1e4c-4440-d9c4-08de30d58a40
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TWJwVVo5VGdXU05RY0psczRuNjZvc0k0ekZkeVVMVThoT2Zmak9LS0FFZHZ1?=
 =?utf-8?B?bmxaOEQxSlFXdC94Y3FMaFBTS094RDQvd0dYNE9lZXJaUWVEWTNtTVpkdUo4?=
 =?utf-8?B?aUx6Yng0eEQweWYwYncrN0hzRFVQNXlFSFJaT0ZYc0dkdG12UmJVQWhuUUtP?=
 =?utf-8?B?VkdXSHFmQlM2NTJ3a3V5b3pnYUVDWWJoaTJ2eU5pZjc1aUpHc0FvbjRtcDVZ?=
 =?utf-8?B?VTJpbTkwTTFIbi9BMTNxN1VUWWJibWhKbFRLbzlFeUFKZ2ZZSm5FMWY4blVH?=
 =?utf-8?B?UzRNRVN2UGJtU2hzV29ERW5YNUlVbXEyd1JWSVJ3M09WTFBlK3NQMnIrM1U5?=
 =?utf-8?B?aVFuWXhtcjgxd0VHN05rM3h5TkMyYlovMkNhMnY2dkM3N0FCQld5ZCtGU04z?=
 =?utf-8?B?L0JNTTJUTkl5clNzd0laeXhBeDAwNlpyRnVtTjRlajk4eVJkSkdqSXdjWEhl?=
 =?utf-8?B?ZXVSNW1HVWhjMXR0UWxRRFVNcFdDN1htcUVjRHFCZ1dwbDZQQncvcytPeW8z?=
 =?utf-8?B?dFRxTzM0clRubTJMZ1FYUkhJejVpVUtSWHZuRFB4Q1pMUGpxYkJoclVtVTU5?=
 =?utf-8?B?WXM0WDUxQXk4Uk9PMXB5TDVDMlcwMDhMazU0K1UxL3VNNzZ5UFJJSFNPVFJp?=
 =?utf-8?B?UVRPOWZGNXRadnJ4alJBYXUzTmtKWEVDL2l6OTBJYnJyN1lWTndwci8yb0Vs?=
 =?utf-8?B?M1dLZmtkSW82MEVURFMvcTl5QVBRVkVOZVpTdUZ2VEh1MDNZczdlbkNkTmp3?=
 =?utf-8?B?eUdtOHoxNWxCZDBDV0ZET2U5N1lZbEFadXdPVWVQUUJzY3FxTkRFVkZLSXFT?=
 =?utf-8?B?aDhFdXN5ZjRoMCtFNitZR283eDhNd2NTY3JLcXBnSC84aEg0aWZTd1dJd2VI?=
 =?utf-8?B?ckNHdS9tOWNiZTRKVU45aHBKaGo5RHFPRlF2a0FFdFN6R3hiSmxOQjFRcElP?=
 =?utf-8?B?OVZjY2JsbWF4V1grdjNZUlBpQytzNk0xVkRlYlNlUFl6alMybUhpRTdTNGho?=
 =?utf-8?B?Z2JwbTZXMjFuOHcwVUtGNFViNklUUmI3dnQ4dUkvQkFzMjExbXV1UVBiWmhT?=
 =?utf-8?B?VEI3V1dGY2Q5S3BOdDJ3RUQrbS9qcVg4c29DTDR0NDVXZkdZOWxDWExmeWhJ?=
 =?utf-8?B?Y0xYSHJPMlhHNWRxRFdZRTd5N0pNbHpXVHVvRGZGejQwdVUrVUV3Vkovb243?=
 =?utf-8?B?QjE0aVlEbnVFUGRzc2dkOVR2eFltRURwVVBiRjZLOWI4MExPQ3UrcGxTOEs5?=
 =?utf-8?B?UHJmN3NvU2NBUFk4bmttdEV0WUZMcmpVTUZ4dnJtRWFMRFZwUW9lWnZXR3hX?=
 =?utf-8?B?aUdWbkhnaUFVZHArS0F5V1BCUUlPcG5nV3pwTng4c1pLNkpyMGI2eUtMeXFZ?=
 =?utf-8?B?ekwrOXZ5YkJyUXdTUE1Mb2g5UGRNelV1c2V0K1NOY21LTVZoM1o0U1YrWDkz?=
 =?utf-8?B?N1A4NmRCUitJNy9MS1UrRzJubmpZS1pTMDhITk5FNjNCdXlSaEZxdUpmZHdT?=
 =?utf-8?B?aFc1b0wxUGJOZk1XTHdKdG84YUVkbm9yOHU5cWpudW9LNjVsbWhCbzJFejlV?=
 =?utf-8?B?T2ttc3NFK2tTdXdrMlRGZVNDWUovcUszdzVTVTZJSDQ4OC8zejdTYVZNbDRY?=
 =?utf-8?B?N29ObitIVDgwS3RZWXBvOVZQMFJidGo5VVN3VDk5SloyZzZHK1RhdXBOaFFI?=
 =?utf-8?B?OER2M1Z2N0d3ZUlIZENFTlorL0VtMG1NSXkwN1VjL3M2Y3ZvbXdpdk12UDRK?=
 =?utf-8?B?WGdZVkNDQ29HM1ovYlB4SzBudC80NkNjRHFDU0JhRVBBS21TOWhUN0dPcExw?=
 =?utf-8?B?K1VSd1ZoZjVEbFZqV1MzV0ErbkcwRGtpTEFwRlhwYlNrSnVaY0Q4NkdRNUh1?=
 =?utf-8?B?aEw4eWxxTTMrV28vdDlnT2pINXc1OHJpMEUrOVRwZmh3RFlmUUJqZzYwc0RL?=
 =?utf-8?B?WXJ2STJQQ3BMYWNtT3VOUmNLcEhwa2JNTVVneGtJUmJwZkFvaVh1Rk5QSUVJ?=
 =?utf-8?B?MEo1blJoVytueWRLM0pZeTU4N1JJTmhGL2UvSnc2WkdwNVRWb3hGdVI2UzZO?=
 =?utf-8?Q?90l6MM?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8614
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7993ac8a2c914ed8a99fd3e3ad360281:solidrun,office365_emails,sent,inline:b4e8d627bcf650b9ee44e40d3046b0a3
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17a1100d-0e72-44f7-8416-08de30d5841b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|7416014|36860700013|35042699022|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG5pb2M5NUtNMkxGeU9YSFpDcUZRdGJ1eUdGRHBjWmMvdkMzOGYwemtCLzc1?=
 =?utf-8?B?WGpwWk9oZkNRYkY0R3k3Vmwvc09oUG9hT3BvUGJLYk14WUhBbVJZckhUaXpT?=
 =?utf-8?B?Rkx4MitGMmZFZ1Z3VFhVSjB5ekhWc2xOc0crSmFXckZUSmJGVkZVWWpxU0tQ?=
 =?utf-8?B?VDNQbUtMQm9OTmMxaitaaXQrc2tIU0g5OHJuM1pIcVk2b0l3U1VWNm1XWUd1?=
 =?utf-8?B?ek91V3BIU0tZVVhmTnAybEtraXNsSDNSTnlHL3lHMWJ0a1dtQ1F6L0MvTTd5?=
 =?utf-8?B?LzVRa2ZIOE9UTGxmNmhUd3JFUTF0ZWFvNm4vU0tkK0Rvb0E5M1dZR0tPU3Zr?=
 =?utf-8?B?aHdUN1cwNDhESVl2TGxURXYvOU9mdnJSb0FMTGRVTVNnYUYweEtmK0hobmJJ?=
 =?utf-8?B?czVCS3R1bXJIcUprVjZRaTgvSUMyUUgxQSs0eWwyV0tkdmh6U2Y3RkZsbWR5?=
 =?utf-8?B?a0g0ZTZnYWVmUTV6di9yaXlIK2oxQTRFenpPVUZDc1h6aDdxOWt5aCtPd3JC?=
 =?utf-8?B?RUI3WXVaTXBuMlI1eWZHVzVoNEYzczRDdlh6bms2RVlrMkxoZy9DV2dsMitH?=
 =?utf-8?B?eC90b0d0SUJyK0x4SHBvMW5LWUVIN2JKMFpSRGttbDVwYjNObUtwT2N4VU8x?=
 =?utf-8?B?cm1aVWQ0UGQ3KzJpd3lGdnJBM3ltaTJ0bmJaUW9JRlJZRmorOHQxSXEyTjUy?=
 =?utf-8?B?VElsZ3BHeTZvWGJhcWgwbzdrV1ppQmpsbm13UU1FQzc4UFJsMUxxaENTL1h0?=
 =?utf-8?B?NEx0eFJEUWxLbVQ5cjE1SGhFdEE5UWhmbXNYbW9jWUN2Zk14TzVRS0NSenRW?=
 =?utf-8?B?WVBoUGJIaUtUQW4ram5OdmE5SW5pSWZvTWZobzAwSlBjWXBxd2pmZ2J2bWdq?=
 =?utf-8?B?cm8wd2ZQcFdXM3loWlROak1PM3UrYmMvbkpsOUJuTXNJSWEzMVptSzRVdE5r?=
 =?utf-8?B?SjN3bm16eFNTbW5SMFI5WnBNTEI1UDF5Smg0SEdQZk9TSWdMVFZEWmhwSWVp?=
 =?utf-8?B?ekZTMnZnMXJhR0RKMW42WVl3dEhaNUFLYWlJeVRTOVdDalFSaTg2NWc4V3JJ?=
 =?utf-8?B?SGpuNjlDZlIwTWlFZ2hnczdlT3pBSGlranB5bjExd2ZJeFRHdkU0NFpOR3Z3?=
 =?utf-8?B?YXVkVC9XN2xPTGNsUjByKzkvazZXbHZvNE0yelYzQ3ZGSG8waCtEeGsxcnhF?=
 =?utf-8?B?T3BXd0pWWGlOUjliWUljdVRGV09nRjBpZ2x0d3R2M1RIRmRIbjdzaHJINmty?=
 =?utf-8?B?czVnd1g4VkU1Wlp5ak5ZMDlCMThIOEFUdjd0ZXNZdlhxaGkyNHcrQWh0cS9U?=
 =?utf-8?B?MTlySldkMURTdVIzd1RCc0ZGWGZya1FnL043L2xPMCtFeWcyU3JTcStHZUxT?=
 =?utf-8?B?cEsyZndUNXhjalk2VWpadmhYU1NBeGJNSFNaNW5vVUp3cGNaeUMrT092ZkpF?=
 =?utf-8?B?YURTdVBncFQwMUpSTnlPR3NPKzFHZ1ozZjh4N3NLTFF6VXpRQk1kdEwrRUZ0?=
 =?utf-8?B?YndvRXNiQUUyajFycXBxaUpydTluR1Y5eXhrU1Mrc3Jrc2dYbWxPK0VmMUZE?=
 =?utf-8?B?VUo0bkwzL2NpK09BbU9IVnV6WGpyUllUdEhPSTRZbzV4TzN4Q1ZIcXBrMTZT?=
 =?utf-8?B?dEp6VGQ3SFM3VFYvTHVkU2FQUEx5amFPb0ZFM2d1VExQNXFydXpNYlU0Zlov?=
 =?utf-8?B?UVc0dGF1dkZYVVo5TWJka1BvTVZyaE9HTU5hcUdINE1xOWZNemJkbDVCVEIv?=
 =?utf-8?B?citHdHRGNk5jL2xPVUlaL0Y1OE83ZUlIc2U1YWs4R1p5UFR1eTRPcHNpaXVH?=
 =?utf-8?B?d1k4THhtNUVJMkgxM0FjWEo3ZXNKWUIyYUtZOUlzMDMrZVZkS0NIVVY4dVpS?=
 =?utf-8?B?S2N6eHA2azhMOC9WTmtVZ0NiWEJKNVJMdFhQdkZDRG1vWExJaGZjSlpnNGU5?=
 =?utf-8?B?QW9jSWoweTE1MUxOYXV5aEVKZzEvRUl5SEY3OWx3VEd4M3FwcWp3c3htTGlr?=
 =?utf-8?B?emF1Vmg0L1dURjVDLy8zTk1jMzJHMzg2SHNRWk9iUE9sNm04S3kva01Ea2pv?=
 =?utf-8?B?MTUvWm82ZjFUbm0rSkpJTE8wamxFOFFhTzB6YUtTZUJrclRWTzNnZ1kxUi8v?=
 =?utf-8?Q?SyUM=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(7416014)(36860700013)(35042699022)(376014)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:31:23.7864
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e297a6-1e4c-4440-d9c4-08de30d58a40
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C711.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10461

Some Renesas SoC based boards mux SD and eMMC on a single sdio
controller, exposing user control by dip switch and software control by
gpio.

Purpose is to simplify development and provisioning by selecting boot
media at power-on, and again before starting linux.

Add binding and driver support for linking a (gpio) mux to renesas sdio
controller.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- dropped mux-controller node from dt binding example
  (Reported-by: Conor Dooley <conor@kernel.org>
   Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- Link to v1: https://lore.kernel.org/r/20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com

---
Josua Mayer (2):
      dt-bindings: mmc: renesas,sdhi: Add mux-states property
      mmc: host: renesas_sdhi_core: support configuring an optional sdio mux

 .../devicetree/bindings/mmc/renesas,sdhi.yaml      |  6 +++++
 drivers/mmc/host/Kconfig                           |  1 +
 drivers/mmc/host/renesas_sdhi.h                    |  1 +
 drivers/mmc/host/renesas_sdhi_core.c               | 27 +++++++++++++++++++---
 4 files changed, 32 insertions(+), 3 deletions(-)
---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251128-rz-sdio-mux-acc5137f1618

Best regards,
-- 
Josua Mayer <josua@solid-run.com>



