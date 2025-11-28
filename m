Return-Path: <linux-renesas-soc+bounces-25334-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC32C928D9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9157E4E217F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8017C298CA6;
	Fri, 28 Nov 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BOu1L3zZ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="BOu1L3zZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021102.outbound.protection.outlook.com [52.101.70.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8AA23D7DF;
	Fri, 28 Nov 2025 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346581; cv=fail; b=nCsxOEkrQQ/y1GrDs4f8ZlbWS0zfQ6qIHp6YMplGJGEGL0PGiuI1MAgvHpgxCxR3P6Ja3Fs7JHWhj4+l070AGArDfItQWpgRfYxb9Vim4CD3ExB0yHgodefR6YPAsY3QzFaPAYBQuIRkOjf0sb/taFpHFj8aQ5YVrSqSl5PtWLE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346581; c=relaxed/simple;
	bh=EevTrriis1K/2bWldFH00EnHAExC2tF22JEzizs7DjQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t+W6oxjEcvzdTI627rULffZ7n7syxjeWN9Gg335jVJiKxZIkhoFXugbqCBeerMjlZV6QkSBqs0rtm7FChhd75LCwy81O0Uj5A7NaAuGNJnGyZBiSr2mUgnonWKsKfS0dsrT3U0770WKrSJhKLuuJALmJb0thIR1wkDkwq521Df4=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BOu1L3zZ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=BOu1L3zZ; arc=fail smtp.client-ip=52.101.70.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OXD6XCUOlZWdaSgswhSBdyd0+MVXtqgjwTnl7HYUVQxGq+sm7AWfK4Mq9j2vblr3+blk4rhFsv3WYlmm95kIOk5R9XEru484fvfJuu9HImfBuk19Q59ZKTf0gLvaD/JmWplWOjqc4syACXTH+/xZFxK9C0lrwATSAXAhYn+bSny95XEMkDIdKOss2kDJmbHGRAceifJG+bhkQTmDcbfQJKxfKjxqp5dLN6APrNm1b9LBMm8ctTRJPOSnOwkbHOLLNLcp/zkDGIMll+k07/+qm6j1oqEFuL9W8ejfZDsaPNOG1QYn+RiF2SRlvfYbR9wjQ0AV/9GSW+70sX405G1vTg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=qUdOZr3N1BXbUVWZL67kTFq9qcnK7MF78WRy8H+QF9W5B3Fg4gatcgEO8aCzwhhGXTSekLeKY8pU4IDkCYWskTJWGPTqVmEwS87rRbxNETgesJWC6HCXpO+3Reijh8nOyvmkcCbIfueyh2L7LMPutauugUmzMRYJFBi51Q+m9pyg+YTxft4UdO2NLdG/tFQL3+JsWr/bvFvXTpGoppvCxP1PbN2gPdPuyvC90j1jS8Ef1rpEt6n41BBSD6xkTsihGZ+CGYK/jzjz2HydXCHxwwV5hFFKrXPtK6023ypiDsrw2Xshrpngwfk6fu1bd0bYPeFL4eM9J3LzuiP/yr4meg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=BOu1L3zZvy19IXxXNqGp71Kc6vNsN6zHVmjogVoD7EsHFmdhSOpHQbmPVxwLWKoFugZx/3f1KJ8iIXXYWYSX8tmbkwClqa7aTgsYR8WK5ihHPIgIubbLiVXGvWfF9RTKRXV8wQwWuUH/FGxHFDIbCWE+QjUTWMBybOFcINvFDqQ=
Received: from DU2PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:10:234::29)
 by DBAPR04MB7317.eurprd04.prod.outlook.com (2603:10a6:10:1b3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:16:16 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::86) by DU2PR04CA0054.outlook.office365.com
 (2603:10a6:10:234::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.14 via Frontend Transport; Fri,
 28 Nov 2025 16:16:16 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Fri, 28 Nov 2025 16:16:15 +0000
Received: from emails-5924714-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-189.eu-west-1.compute.internal [10.20.6.189])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D4A8880795;
	Fri, 28 Nov 2025 16:16:15 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764346575; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=Vfng3YOffd/LODbaPg90tkN8wxIkbHoZIW+4YDVz2MwgR4UVW++at4TdiGy6OfRZYv33j
 gFxkXxr8c10g63yWtqhkJGn+yRbrJWywhCGJxuVtlTT+0pP0E5fGz/zKs5VVJcISXxMRDpH
 wAZDAHLiVrn11OBfcfUvyhL2KbZTAps=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764346575;
 b=PhxvINlrbzcT39orqkQPoJJc1w4lLNO7Hzophd/ukARueNEQl6+bC75mQVfVrf03dVXN+
 7Vl3Js7sThks8XxVm9+jznorx2NOw4Sgd/1wyUpfFLg/MoRhdWI79lhYxpAjmi7g0Ge1iuq
 W4sOX8swVRS92OGQONYl4FRIY43ACQ8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twgoqD9Z+RYnwWRuUCDgHOudIsBKHgE63TfpQPdgGUEHBc0iXFNGEuLbhrZlt/v56Qa7eYzwffYgGP8FbRboZcwchxmkz/uLuwFV9q6HAZHt+GNHzJkms5ya58c6iwqEPC+ZerILTVM3Pqx/cS21AcBmEoXwiijqMQMveEv/q/SZbVGiN7O4HIB/UEoZ7cK3xXqaaOiaJ1kYasO7vMdPWRhtoh+XPiZAGrbnCzyeAYcz+61iMXb/J7dvS/YwXoWKU8nxA16WD5/Ze4JjeiX65O6xPOU6hOr1NT7dIPq+wevdT9oR3FDoXN7JLRwyl92jSSL0jkbdLjaynLeu8H5p9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=NFwAHbWIBYKeXtJazmYyW25EmyP9YAD9/nqfHxCMR2Fq/531KO54osm6rILrzuaCKWOaEISioV7whQvnTzFzHkz1sYoeSHWguKiahTxWAZX9qJHpQ3FjmxVZ3zBS7BHpZ/ofyIh2YLhxjg73oePhLHCVyQOJdm6tiUkqKJNblvg8OCqLS9pim0vIxgIzSp8AGgqsBEEfiP8W76RMiSmuWSB/Dy2fBry2xOXN7S+f+MPRFLt0toi0YYEtJ+POU76GremIus6y7souzzFNq062EHTXJ++/jbVgDVTeuUYvj6n3yhRjPRNjcmrEp6wRPMhUP2dryxHZKPeiO001ZfpSzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=BOu1L3zZvy19IXxXNqGp71Kc6vNsN6zHVmjogVoD7EsHFmdhSOpHQbmPVxwLWKoFugZx/3f1KJ8iIXXYWYSX8tmbkwClqa7aTgsYR8WK5ihHPIgIubbLiVXGvWfF9RTKRXV8wQwWuUH/FGxHFDIbCWE+QjUTWMBybOFcINvFDqQ=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU7PR04MB11210.eurprd04.prod.outlook.com (2603:10a6:10:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:16:02 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:16:02 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 28 Nov 2025 17:15:39 +0100
Subject: [PATCH 2/2] mmc: host: renesas_sdhi_core: support configuring an
 optional sdio mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-rz-sdio-mux-v1-2-1ede318d160f@solid-run.com>
References: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
In-Reply-To: <20251128-rz-sdio-mux-v1-0-1ede318d160f@solid-run.com>
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
X-ClientProxiedBy: FR0P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DU7PR04MB11210:EE_|DB1PEPF000509E7:EE_|DBAPR04MB7317:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ed0707-ef85-4471-2fd8-08de2e9974f0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SjNpaHU5VUU5QmRqWEtvSWU2YnNmTFpzQWhobHlqN3YxdVdldXd5aGJyOTJ6?=
 =?utf-8?B?NGtyV05WcjdiT0RQbWxaMkVGeHhVRWdQNzFUa0FNaytjZjdWK0lhNUUvY3BY?=
 =?utf-8?B?RzNnczVnc0NhemZ3a0MzZGw4aGpaekFJTS95NmlTWnZwS25OY1o1Q0tLYXZw?=
 =?utf-8?B?Y29XOWx4eDdPNXM5KzRFMkh5Vm9KbG1QZS9RVGJNelg2TzRTL2l0NjFxbmpM?=
 =?utf-8?B?bkJhUDE1ZnFTd2pNL0s3R0FqYWVuV2dEYjlPYXptT2hHcm9qWS82ZEtkSUxW?=
 =?utf-8?B?Z05SMjNRUWtDUkdmQjBkZ01uVCtsaFlUcHlrZDhOZXUrdmJVYXJYUFAzV3JC?=
 =?utf-8?B?SE9iMEo1SUt4akFqeERzbHJ1NTRvSkJRVkorTDdwbThxMWN4VmpTNkIwSmtQ?=
 =?utf-8?B?aUYvTE9UTmFJdTMvYmNkZWlCOHJLQmxTaE5PcWhaaHVYdXZJVGswbzlTNTdx?=
 =?utf-8?B?dXlWM1pGV0JhSFM3SkZpMGF3YW05WEozVVllaENUMEhCUmJXaGZHQ2s2RENK?=
 =?utf-8?B?b1gzYWJYQWZ3aW51cmFvT1I2RDFIR1dRN1VaSDZZT2I4NmZIQnBQQWg3YVNY?=
 =?utf-8?B?MnlHTlFPTWUrZzdKLzRFbU4waTkzZXdIWmNOcHlMcUIyd3JzTWRZVG1mVzBU?=
 =?utf-8?B?V01sMHBKRExodTd2cnhzdHhlTHEzNU40L0Iza3JWQVVnQ1NTaFlSUFJnMUJi?=
 =?utf-8?B?bzVqQjRTdnpPRWpYUTc4VCtoSDd6aEZPOEpnaDluaTZoL0FmVHlhLzgwUkJt?=
 =?utf-8?B?NDl5eXZzTmF5b2pLVU0zYmNSUHlFcm1hODJLcDdmTkxRR09meVN6SG0xSUwv?=
 =?utf-8?B?SUJYRmdvSU9oSjZmOEZpNmI5WlVSUDdxcWR6UDRZdlFQWkE4Sm1SSnRVQ2VB?=
 =?utf-8?B?dFZrTm9OQkw2Z3pQRHA3c0k3WjlsRUdFc1gzKzBHK1lZcXp1NE16NGszYjRM?=
 =?utf-8?B?QU5tclp6cWUyUWVxS1NhY2RLS1lScjllYzdSSENaZU1WYjdKU2NvSnpSYUV6?=
 =?utf-8?B?YThxZ1BIdXptTGVaWlhIU2pmVkRKYW4yYWQvNVVGd21HcUlONHMyQTVmYzRp?=
 =?utf-8?B?YndWcTVlaGRvdkN1T1IySUZKR2pVL2hJU0VoaXhuWm9PTzYzK21SUlVHUS90?=
 =?utf-8?B?VDJ3NVFPWXo3WnBiTHRwby8rRWVRWTdZN1FSbVo4aFd5bXZRM3kzUnV6SFZX?=
 =?utf-8?B?M09DOFZSSGcxVVo0dktzZGcyR0daSE0yWEQ1a0JPb29hQ3E5eHBLVUJSUDlO?=
 =?utf-8?B?RXZKdkhmamRDSnlTeXM1b0hFSWZyajlFUlVjaGsxZFlrMmRDc0ZEZDlWZEpU?=
 =?utf-8?B?NkhwblFMUVVBRzBtazNmRno4cTA2ZnJ1cWs5YWlsSzJlKzlJUEdiTy9hdUxu?=
 =?utf-8?B?eTBua1l0YU5vMFB5bE0waHJqRnVhRjJKdjkwclExdjdIRm5zS21vdVFhRDdU?=
 =?utf-8?B?eGR2ZEhMQWNCS0FXVDZJam1GbmovWHY5cmRvejJQTVFxemVrbVZSajlTd1hj?=
 =?utf-8?B?UnJjQXMyY3NJektWV0ZCK215ZzM1Rm0yMzhYUkc0RllqRGpaa2RqeW5KbGNS?=
 =?utf-8?B?TGYvdGw5dldiMEdqSGFQR0Y4NWtvbFo2dHZQVDJ0RHBreTZ4ZXJyaHlVYzMv?=
 =?utf-8?B?MHVRMHErT1V2eGJ0MnhjQlN5UCtMTlREWGEwUXlPbXpVeUNlcGZMUmdLam44?=
 =?utf-8?B?VnpJc1VtRDdPNERDWmlyZlcvaUMwbmVxR0thRHpKZTJzcVZPVFRYVzBBSkts?=
 =?utf-8?B?amEycWRNL1B1dEhOT2dZaS9sbXFvSi81MVVzRTZMemhpSnNoYkJGcVIreXFp?=
 =?utf-8?B?UzBjR1B3WVBscm5CaS91Y3dSM1Nyd3lBN2k5Kyt3NngrNmpVeGt6TmtHYVFj?=
 =?utf-8?B?cUk4S3N6bFlnU2JwcDRlQ2NJeTN3a1ZrWjd2bFZuZFZVclBPK1lsVEtaWTND?=
 =?utf-8?B?bitKVTlXc1FvL0R3dVd4QkhtelBXMTV4RTAwS1BicmJrUEdaV0Job3R6cjdU?=
 =?utf-8?B?WEFFbGcyclZabDRyYmxjaFk0VGFvY1ZldFY4YkcyOE93TE5GZzQzZ1VOTFVw?=
 =?utf-8?Q?iGywS0?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11210
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e3b2d2f4ba734d449bec9124cc5fb302:solidrun,office365_emails,sent,inline:b648773eeb86d04166af9a7a9fd888ff
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	aedef8bb-4777-4a92-355b-08de2e996cc8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|35042699022|82310400026|14060799003|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OU1kMGV6Z0k3S3ZWdGhnQjFIQXloOTFZc1NoOGQ4Z2lBSFJObWhNTkRWWnh2?=
 =?utf-8?B?OHFMTzBTY2cxTnJVckVOa2lkZUFQeW1RV2RvZnQ0aWRwdTJTcC92b3paTUtJ?=
 =?utf-8?B?S3NmeWxMQlh1Wk9CZmFnUElzTkU5MDNkcmJTRE1ZK2tmcS9lK21ZaUpRTnRC?=
 =?utf-8?B?bGp4RXNoRzJRTkw3ZitYTStCLzZkN2t0ZElIS0I5eXA3Y0tDV3ZET2dnM0o4?=
 =?utf-8?B?MkRhb3AyM20zMDJzOVJCZGorbmtqRlc3WjJhR0tvWThrc1dXbUN4TlVLRFZN?=
 =?utf-8?B?ekxTcVV1bXljWnJCMmp2T1dmMmQwbnBIKzhnS1ExNnIzWk5tN2Y0bWVaYlkx?=
 =?utf-8?B?WmFoeDllYXFwMExuUDgzZnFnbUluOTl2WGdKT3Bud0RONUZzd1FpVjZZZDZK?=
 =?utf-8?B?WE83VytnMm5iaGJQa1BOMDVUS29VNFBQSTRwYlBzS3NhU2s2L0Nkc2lTV2p3?=
 =?utf-8?B?bmh5REFZWWRkaVEwRFpxVDhSQ1JzUFEzMHgzU0ZPcG9ORUtRU24wV3l3MnBl?=
 =?utf-8?B?UmY3MUFNMEJBTTlwZkxpV3d3SDF6Ni80TEl0eUFjMWtrbDI0aXlMTGRudlI0?=
 =?utf-8?B?ZitJODh2MVVPazU3UmU1UER5WTZjSWNNQUd4aUN0OUVGSzJPdGd2U1dwWVQ2?=
 =?utf-8?B?YkR5dm0zdkFpOWQza1BWWWdrT0p1MDE0eDlKZFZ3NlZBd1o1ZExHN3l6L2pE?=
 =?utf-8?B?amU2UisydjBSTWoyc09hbWN1c1MyVXZaQ0JpcDJBTk9qZ29Sc0hjV3VSemhO?=
 =?utf-8?B?TjdRcElST2pSRUZ5dkdKS2VhbE1vUVBpQWNFVEkweEs0dk9jZDlMSDliUjB0?=
 =?utf-8?B?YmtMb3hFQjEwSWprelMyU3dUM2ZRNkF6aVZTelpwQW9OTWd6dUNRdkNtcGox?=
 =?utf-8?B?bVpQajRPbnZaTWNWV1h1SUsxSkh6dDlYL1ZvY2wzeldwem5tTHp1TzZXMXQx?=
 =?utf-8?B?cUlGR2VQMkxpS253R25hUWNZYnYrQ01rcTA1Tk84eFp2Yks3TDZGRHp5OWU2?=
 =?utf-8?B?ZW1iT0lBSWtUWHMwYjVicUNqcGtQaXI3Tmg3R2wwVHpsZStWai9Hc09zMlF2?=
 =?utf-8?B?ajhGTGJuamU3dUZhTVFkajN2RTIwZlFUZVU3Ym1sTVpuVEhtN1RROEpDcDJ3?=
 =?utf-8?B?djA5WlZFYXhHeU5ab0tEZm8wOCs1WGU5QTVDRE5CTEZ0ZE1JY2dOc3RQdmdI?=
 =?utf-8?B?akVPNG1GZGVtWUI3dXJWeThyOWVoTVRlSDlWa2QyWkZBNS8rQVd1OUNLQ0Iy?=
 =?utf-8?B?K3JRbGRMck5Sdkt5U3Vpd3UydFRza3Z0ZjBaM1pUVUQ2ZVBraG5XbGt5VnAx?=
 =?utf-8?B?YXlhRmtsTzVuQUtJTTVRZk5CMWFSbG5DN0JYWmJtTDFaaVNSWjI1M1N0WG5u?=
 =?utf-8?B?bXZ4OGtwSnJjcEpES2NzU1hhSGdXVVVsSHZvb2dYQXg4WTg4L0pybkxabGJj?=
 =?utf-8?B?anpEb1FyeklwWkhNUEF1YzhUdzRlR3dPZExQSUw1eWppMGlMOHI1RWlSTHc3?=
 =?utf-8?B?OFVrN1R6c0V5TU1oSnMrN0pha3RrRlNBazBudUkzQ2hUaHZFbUM1MkM0cmdZ?=
 =?utf-8?B?eWtDYUwxUnZ3THZVeFJLOGRibVFEUWRYZURFQUZFcXFiQ3dBZCtpMzZxVzdW?=
 =?utf-8?B?QnpiMGRrQm1oNGNXanZqZ3owMjBzcUxPM3kxc1J1YldwZEUwb0FUcFJ0VWhD?=
 =?utf-8?B?U3ErbnhPSnpTY1Y5bjlmdStBai9QbmR4TkZqSzFOMGRBTmtEZmkzZ2d6UERx?=
 =?utf-8?B?NWh1dWQ0QWhPQVN3UTRvVFp1dzlSY1RmbXdPYURIbXpoUUJycFFFNW9ZbjFn?=
 =?utf-8?B?TFpxc0tGdkpOczBNWk54QWp2akM0bENsS25xM1laR21FZXl6bGhpRmM0NGRx?=
 =?utf-8?B?YUJ0Q1lwU1d2TW1UT3A2ZUFyVzA4QTdpb3V4SmJ6VGhjMHNBeVFET2dHTHdv?=
 =?utf-8?B?OEMvQVhTalNYbldVd2pOdmlrR1F4dVZOdnRyMTNvamdRWmkwREliaU5NMXFW?=
 =?utf-8?B?bUlldE5tMnJBRVRPcnZBV2tDRWw5UnREb0NtK1dua2RnSGdIc1o0dFRMMTBV?=
 =?utf-8?B?TXFCbFNqWEIrbFgvNCtXYkRLNS8wQ2Q1Y2VyM2o3aFc1dnhkZHFCQmw0enN4?=
 =?utf-8?Q?lfaw=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:16:15.9544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ed0707-ef85-4471-2fd8-08de2e9974f0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7317

Some hardware designs route sdio signals through a mux to support
multiple devices on a single sdio controller.
In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
switching between soldered eMMC and an optional microSD on a carrier
board, e.g. for development or provisioning.

SDIO is not well suited for runtime switching between different cards,
however boot-time selection is possible and useful in particular with dt
overlays.

Add support for an optional sdio mux defined in dt and select it during
probe.

Similar functionality already exists in other places, e.g. i2c-omap.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/mmc/host/Kconfig             |  1 +
 drivers/mmc/host/renesas_sdhi.h      |  1 +
 drivers/mmc/host/renesas_sdhi_core.c | 27 ++++++++++++++++++++++++---
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 2c963cb6724b9..c01ab7d81a5af 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -707,6 +707,7 @@ config MMC_SDHI
 	depends on SUPERH || ARCH_RENESAS || COMPILE_TEST
 	depends on (RESET_CONTROLLER && REGULATOR) || !OF
 	select MMC_TMIO_CORE
+	select MULTIPLEXER
 	help
 	  This provides support for the SDHI SD/SDIO controller found in
 	  Renesas SuperH, ARM and ARM64 based SoCs
diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 084964cecf9d8..9508908d8179f 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -97,6 +97,7 @@ struct renesas_sdhi {
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
+	struct mux_state *mux_state;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f56fa2cd208dd..c58f412ea2028 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -26,6 +26,7 @@
 #include <linux/mmc/mmc.h>
 #include <linux/mmc/slot-gpio.h>
 #include <linux/module.h>
+#include <linux/mux/consumer.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinctrl-state.h>
 #include <linux/platform_data/tmio.h>
@@ -1061,6 +1062,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct regulator_dev *rdev;
 	struct renesas_sdhi_dma *dma_priv;
 	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
 	struct tmio_mmc_host *host;
 	struct renesas_sdhi *priv;
 	int num_irqs, irq, ret, i;
@@ -1115,9 +1117,25 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 						"state_uhs");
 	}
 
+	if (of_property_present(node, "mux-states")) {
+		priv->mux_state = devm_mux_state_get(&pdev->dev, NULL);
+		if (IS_ERR(priv->mux_state)) {
+			ret = PTR_ERR(priv->mux_state);
+			dev_dbg(&pdev->dev, "failed to get SDIO mux: %d\n", ret);
+			return ret;
+		}
+		ret = mux_state_select(priv->mux_state);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to select SDIO mux: %d\n", ret);
+			return ret;
+		}
+	}
+
 	host = tmio_mmc_host_alloc(pdev, mmc_data);
-	if (IS_ERR(host))
-		return PTR_ERR(host);
+	if (IS_ERR(host)) {
+		ret = PTR_ERR(host);
+		goto edselmux;
+	}
 
 	priv->host = host;
 
@@ -1200,7 +1218,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 	ret = renesas_sdhi_clk_enable(host);
 	if (ret)
-		return ret;
+		goto edselmux;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node, "vqmmc-regulator");
 	if (rcfg.of_node) {
@@ -1304,6 +1322,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 
 edisclk:
 	renesas_sdhi_clk_disable(host);
+edselmux:
+	if (priv->mux_state)
+		mux_state_deselect(priv->mux_state);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_probe);

-- 
2.51.0


