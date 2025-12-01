Return-Path: <linux-renesas-soc+bounces-25439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A160C974A9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 01 Dec 2025 13:33:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B16334E2B1F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Dec 2025 12:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C8F030EF6A;
	Mon,  1 Dec 2025 12:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Cf49h6oQ";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Cf49h6oQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020124.outbound.protection.outlook.com [52.101.84.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87A630C63E;
	Mon,  1 Dec 2025 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.124
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764592295; cv=fail; b=SVHNr0PSzhvH3DgXmJ43T8rEAzgWVAVQ244S5xk7SVdqfaMVe8A6am85XifKFWK+Rd7FQ0olZqkrOVlfJ0AWGVkfa9z3TG/IHlEJUfkplHGqMVLbF/0QfJ16Xp+2o9ZH+DkzXoA/cs8SpHBgnnj1JNDdRwmpJ0Z+pEVXtiWUAN0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764592295; c=relaxed/simple;
	bh=EevTrriis1K/2bWldFH00EnHAExC2tF22JEzizs7DjQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rYvz0VZoohL1nL/NQrzarqtaHATZE5syYAtEU4/xwzgF86bHY6D2K+UldQQqrDiVFkvbTLeSTl6QLZ+FU91KJfns/kaEkAUQwFZL5yY/TUX86Ku+pIkCeDTl4Fn/wvnPSBEzxxOcnU5khEt8NIjdtwc5Flq+ISUGoDlQMFOg56Q=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Cf49h6oQ; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Cf49h6oQ; arc=fail smtp.client-ip=52.101.84.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pnmRcsDDrUiyzZ6+gKVveMkaG1mk0JRtbBTOJ7SRE6I09lbIiXeqZp1jQ4i4q2kZW/QsqlD5updOoI4S1GD8dhhPf4vOLr0yq74Zq+Ub1eBOdS0F9Imu/NmdgOthV8mLNlMjnYyyOAQMA8vao5ve8uYL/Ct0C41ClZ7Rm+cj2uBm6x7ZvXAdvK5JzSapunXh0qj0O+VNxtDu1wvm6zKw2NS4pNdUelT+whI6XThhtlewMCZA/OXBsC7F06DMteS6j5SJgO8oYmklFBGMYnnn5cOaV0KHphdGmQSWIiFIdakSIXHJSeBse38n6ePJf1T1RTwTKbPMVA/He9/osb7CdA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=eJ+5hC9If7U11IWqBGPHM7lq/++HsLDfamXnYlksz1THxRczR9fbU9h9FKRxWj5dgyBmzTNM4C+Y0REzNtJqUR8SkdXRuJJlIICIL4vh5Kl8ZOPrMT+Zd+hfuwlP6vZeEwYNSAhnbwYxQc7Ls1ItMksU22AketVASOW9Bkbot6LPeDksH7WxeYuLcDpz5G11I2eOtfPXQqz5HPO7RpfSUfRSakyBy7BtRTvKQaQV64a/jzMF3FQM2bfM8SreRyBASeAKcTbfxpbiR6sox6fDdFDErQ807ML/Wb+5tody0ZxsJklccn3o6Vbq8SSZZyViQ2kQCb6LT6RzfImL19JQwQ==
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
 b=Cf49h6oQR+e6vydlyehTnGxG1N30q6jyRtd8eoyrQ0gBss+RnyjyRSb3jltwWyuand3iGgs7Ri/3tLqRfuOJuu/4sW9rDB21rqQw34zA1XJ8hqRh05e/XzhCShNdN+6DSCSy7qg0UL/dva2HJ9sjycleAKmuHWINRND7Q76PskY=
Received: from AM9P193CA0028.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::33)
 by DU6PR04MB11207.eurprd04.prod.outlook.com (2603:10a6:10:5c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:27 +0000
Received: from AM4PEPF00027A65.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::2e) by AM9P193CA0028.outlook.office365.com
 (2603:10a6:20b:21e::33) with Microsoft SMTP Server (version=TLS1_3,
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
 AM4PEPF00027A65.mail.protection.outlook.com (10.167.16.86) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Mon, 1 Dec 2025 12:31:26 +0000
Received: from emails-2893024-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-226.eu-west-1.compute.internal [10.20.6.226])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BE27E80115;
	Mon,  1 Dec 2025 12:31:26 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764592286; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=Xdu/QyOqV5nnxsW1XjxjMRifLujwSFojdiHseC1sBOAUNjOrSlZOxhCytdHoKxXCOupPs
 D6jSS4QvDCoscVrZOW+S5MkbxW4MLeiZ4z3bWhC47ewn7aTfsoZiC8IZPnYbVEwz4i/awCq
 Qe9ACq+SeEz1mjQckTR7kvOi/Zejr3s=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764592286;
 b=ebJdbXBqs+ynBMdy7k7EsU28Xs1N/7ddrqd9eHjwixH5iBUYBFRimi/OwC220Ou85cB1m
 oAXOfDW8AdUr0HaBKefOmSV6PeoXyhwIuXRyKT1oqv1iNfnh3wYJhZBfwTcJbhVM2qa8A1q
 8/w5r2JtN2PJTSnTzSO0NuX8DhGEsQ4=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STxM7eOJrChB/K3kUwTdKu/FlaBEQsNotR/k4vlyKs1QjKxwXFBOBWzioId4rTDyD0iTdbPg0EAPstAdudgpCcfVDKz63r1ukW2MuF6lxteZeduGmgxWLttDIfOM4ryJ/xHFJhVurm446rSLc/bTMA63AAXhwdPNZxm6Ls3yxX/I7M33MuG4NQzACzHgsQxTlXBzShQ5pBI/6vQn4GYKJ/lnCPBXlEGw2Er5PvGGrZvUD80kk0LS+K8zYT5X8jyxung0G8/D3LWzILDNRyXa3TUXexcKMjDiEmXtMEqVtEKzlKfBH8KBOE/Df1HZyhbyVFjb/6PYcs1WuyjsCeRleg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=ju1/ciKskoVUOwFJZ24aU/yREcSxZZdcHZIH6isHfS+crC1KOiIpESpsJw1EWwI/A2O4ufSuMjXhia493Xri/VXSevyq8ef5IfK54I6/LED5N1yxniH7fHfgkd4PdD8bwdYJ0fQ1YbDGqd3EOY8py+sICrqPzF+wUKicHKfGyxfEpIesMFeyX6Lf5GvHjs280UP0ynHSj+YhTtSprQbq7qaQqjypUtKZC3F/wpam45WAAniHtvjhnLTHLXsWx+xbx6RRpG6kvsHxkETN2w94YCIvT/ViZDSxeIgQc3JodP3wNy1o++hE38lHOaflYCUWF6I7HfffGRIPulGdwmgskA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py5gerQfOJ5gy+G9umbBiom8d10AKz/EbtRUxREO8vY=;
 b=Cf49h6oQR+e6vydlyehTnGxG1N30q6jyRtd8eoyrQ0gBss+RnyjyRSb3jltwWyuand3iGgs7Ri/3tLqRfuOJuu/4sW9rDB21rqQw34zA1XJ8hqRh05e/XzhCShNdN+6DSCSy7qg0UL/dva2HJ9sjycleAKmuHWINRND7Q76PskY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GVXPR04MB10897.eurprd04.prod.outlook.com (2603:10a6:150:215::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 12:31:18 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 12:31:18 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 01 Dec 2025 13:31:11 +0100
Subject: [PATCH v2 2/2] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-rz-sdio-mux-v2-2-bcb581b88dd7@solid-run.com>
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
	PAXPR04MB8749:EE_|GVXPR04MB10897:EE_|AM4PEPF00027A65:EE_|DU6PR04MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: e0ab998c-708b-41dd-96c0-08de30d58c2a
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aVgzOXA2bWxSRCtZVzdyUjRlNWhmM1I3QXlsYlI4VDgxQmozZGkyTlByQVNS?=
 =?utf-8?B?L1YzVFlEK0ZxeGJaK3NyRUFOTTFzSmtsV2NGejR6YVRiYXM5aTcrdHN1TjU5?=
 =?utf-8?B?N0dOc3ZtcGhrVXhDbHFxeWJ4VWJxMHM2ZlY0bG1zbVp6Q0lZeG54NGIxaWxJ?=
 =?utf-8?B?VmRTU28wdEVweXlKWGlIQXlKY1U5SXJmaUROTGhVT2NFc0pITFd5SEtqV2dm?=
 =?utf-8?B?R083QS85cW9HOFZzc013MUQyWFhFU3R3clBLeHB4NysyYVQydkxMZURSVXEx?=
 =?utf-8?B?bzVWalZkS0RrNEJFcHUvdGo3Ukt3NGt4NFdWNk9ZT1NnR3RLTlo3dDBpMlkr?=
 =?utf-8?B?ckQ5YnpJZ3J6Wmt6NGpzdWthb1F2ZDZSM3kzMVl4ZGg2RVdZSDN4RGZVblBP?=
 =?utf-8?B?Mmo4UTVnbmY5bUlSeDN4QWR2T0ZwR0kxWXI2WFd5TUFBdzVheHhibThhSGNM?=
 =?utf-8?B?aTk2OERwalFqR3ZDSmNiYXVTaUQwcU5UQXZUS0JJaEg4Z3k0bjJLQ1R1dzJO?=
 =?utf-8?B?SXVnSWJKRTJ0Y0VKSmF3ajd6MG1ZNGs2N2d3V2VCUFZRUTF6bmFFaDR6amI0?=
 =?utf-8?B?bEs1U0hpaytJTFk5T2pwU3RTajhIMjB6ZDVVNW5zcHIvcThsc1FnUG1pT1hB?=
 =?utf-8?B?VEtjVllrbFprSGhhTlcyNHRzT2RGSzJSQjdFUGptVjNtdWNIa3Y4L2ZMQktF?=
 =?utf-8?B?WEFPbUkwalFnb1BTNmNhNEpKU3Z0eUMwMkozWHhiOCthNkRrNktvdFZkeEJN?=
 =?utf-8?B?SUxQOS95Y25KRFEvYWk5eWpPOG5LcDB3VVFFVEROb1IzSk00aHZ4Zm5qUW9p?=
 =?utf-8?B?SFZ4ZGo0RFBvSk1wRGZEa0RCa2lxNFhKblJvUHZQVEdTbkhDbVlQNThOVDdp?=
 =?utf-8?B?YStzM3VzRURwRlZmRlY5RDhKQjMxWU5vN01Fb3dBWkJ6blloZ0pvT2liUlli?=
 =?utf-8?B?QTJOVkR2RTlZTlZuWFJDSHc0dHFvYWtwR0VVNE5CdjFDS2NHaWRLTk92ckpt?=
 =?utf-8?B?Y3RwMERzb2ZRanZHTjYwMlh3RVZSODF4WkJQRCtKUnFWaGRER05FZlBsRFdo?=
 =?utf-8?B?WVBPS3c3OTlHYkJFd3dsWGhSSnhjQmNwcVdJeExSd2IwWmdsSmtSbGVYZFpa?=
 =?utf-8?B?YWUrSiswcCt1aU1Eb2VZVDJUTjNSNlBTRnRrVk42c2M2Y21ua0M4Z0JUMytq?=
 =?utf-8?B?SkszWDRjWmluaVpIWUZVSTRRMUxMYWx0TUgrVTJGS3BGOSt2Zk9VTEtxN0t3?=
 =?utf-8?B?dCtTNklON2tnRXdFY3p6UkxoUUdEWmh2Z1EyQzBSeExRSGJhRUEzODh0c01k?=
 =?utf-8?B?TGY2NGtuT0ZGVHVlV09LMGlnbmVuWmtzOWtUUzRjS2R5cUxNcEJRSTM0YUdu?=
 =?utf-8?B?V0JLdVBhMVdENUVnY2llQVN6bXk0cDB5MlI0K3E4SDJKMUM5QlhsdGZBWUJH?=
 =?utf-8?B?ZUZEbG9tM1JWc0FrbEFhVGU2TC9NMFdRanMzK3RxUCtZZ1FLKzJQaG1Sa3Ji?=
 =?utf-8?B?R3JtRVVVZjBrYmRybXhPWXowdFJzWExtcDIvUUViSGlDNnU3U01zM05KWWhX?=
 =?utf-8?B?STRZQzFqNE1iUlpKZEdhNjh5TDdUR29PdlBzMmlTaTgrS3BOR1FuTlBHZG10?=
 =?utf-8?B?Y203WTF6bXBGQ0lmSURwdWhnbnB3V2dxNVM3SXNBTjhWR3drdUYwYzVydXBX?=
 =?utf-8?B?bjRLQXdQT3hOTHdzUUdqdnRJS0NOOEtKTDY1clZkSGI3K2F6bnBvL1Fmajc0?=
 =?utf-8?B?ck9qZnRnMVgyVms5S0RZakdnaEF0a0JYQk9kN1h3RWpnSWhERGw4YnlCREg4?=
 =?utf-8?B?Z2NxdjVMaU05MHhjZGE1WnJpSnhkc1V6Tit3LzV1ZC95MHBPSkowYXVMaDdp?=
 =?utf-8?B?d3dHTUUxTWc4UFlOY1B5SHdobHZxS2lIWGNpSlJnekNJRFlTaEYwbHp4NWw0?=
 =?utf-8?B?TmVCekh3VU0rVmVhNXg2VW1oKzVya2M3Q29oQm9WQ0hSMGRxUVlIbzQ4S1Ra?=
 =?utf-8?B?VENmRXAxdU5OSjMvZkZCZjRTMis0ZkZrNzJHWFdOMk1wOU9hdjloSXEzY3U0?=
 =?utf-8?Q?4no/Tm?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10897
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 78164edde2f24df8bd6c276fb1a6710d:solidrun,office365_emails,sent,inline:b4e8d627bcf650b9ee44e40d3046b0a3
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	59d916cd-61a3-4f44-d011-08de30d584d8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|35042699022|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHBDVUwzNnYvZG1vZUhwcVB1ZDFIeUJmMTZ1TnlYaC9OQnY1Mk82ZkhZVGdp?=
 =?utf-8?B?NWVaOWpRcTJvM1UxSWR6YlRqcU8wN21BcDBOSmFxM0RCZVRwanQ5TnNuSDRC?=
 =?utf-8?B?V3FyL0MrOVZKMnpWWm9UZTJ0M1RxaFJqNDRDeW4rQURvVko2YnJhOHVWUWRk?=
 =?utf-8?B?Ull5SXYxRHVPZ1NabDlFa2pjbTZHdUlhamZaRERhMlNsOFJ6U2xNZTE2S2dX?=
 =?utf-8?B?aUpITk56VzgwRHRnTHkwa0JoeVFYVmJ5dnhQckVXcjk5VkdpTUZlYzg1a1hU?=
 =?utf-8?B?M0FqZ1BkRUVuV3JxeTJ4SHhjRnVDMlV1MG9Bd0tBWGdqRlNzUm5yQm9qRGIr?=
 =?utf-8?B?bzl5ZlVrUlVUWGVwU3pMS0NCQndmcVEwd1h3WGsyaTluMHZpRkNEZzBNam5E?=
 =?utf-8?B?QjdIaVE1bGxLNTAxYnl2SkUrc3cxdkdrdVBSZ2RpKzM4QnVJV1k0N1pYV3Q4?=
 =?utf-8?B?NDIxcnREZ05YSzJUSThPOVhCVTV1SHZmbEVNc1pXQUgvL05PZEdKRFFmSWQ4?=
 =?utf-8?B?N1ZVU1crNzhyeWtoTE5CTmcvT0dQNXd1dE8zTjMrcUlETDFPOFR5YzYzQ3kv?=
 =?utf-8?B?YVJhVFpQbnlXaHdBTk51ZEhiMjFRbjQxZlMzNWJsbFIxWlpZbkNoSTlSU2w1?=
 =?utf-8?B?c3p2RGEwMVFFcFFXTjZ1SkVYa0tyL2pyanEzTXYwd094T0tQc0dRWWpsQVZv?=
 =?utf-8?B?enFmVlJ4U1h4L2h5VkNCWHcrc2U4aHpGNHcyUnA1SWc0TFFTT1d4d0s1YnQ3?=
 =?utf-8?B?TmZIRkJJcEJtWWdWZll6TXNzSFdUMDNjZEVBeFpRRDh4bmlmS0k3THdRQjVP?=
 =?utf-8?B?cUN4NVVWSlFIS1lkZzNId25ON2ZmMXVDSGhySFlPWWVWWVFGZlRlaTVQTStw?=
 =?utf-8?B?cmE2enh1dG1XaDFrbC9Ibm5NakoyaEhHTlR2dWYyR1NabHdaYUhxZzFGVm1V?=
 =?utf-8?B?aXFBNllQMmpaMW41Z2tFWERUNjVETnV1cjRiTzBybENqYVpEc2tPZ0psYjhQ?=
 =?utf-8?B?Y0Jzc21zV0grdnRsRFZzS1FhWEJST3BzS2ZLNnVQVkxqUUZxTUZlMndRSGtF?=
 =?utf-8?B?KzBpTGVxMk1FS001OEhwaU9lamJXNkFYWXhtZzI1ajFHSUFFN1ZjS3l5SDZr?=
 =?utf-8?B?U2ZLMzlnNjJzbG9naGhLZmUyUXBxV3V3ZHZqWG9TYWVlMDFEQ3dHMUhkT3hl?=
 =?utf-8?B?WXNGdTAyeGI3NmNlY1BYaU9ZYkR5Ri9wSVlvZHIvWmNTa1BLaHFER2FvcFc1?=
 =?utf-8?B?OVlUbmVkdk42MUNpdzVmOGwxMHV0ZlcyZ3ltL1c4YWNzZ044RlJOdURxckRh?=
 =?utf-8?B?cS9aZmhkK1V3QkV3dnFKcnhNSStaT2xFTTdlT0N0SThRdkdPNXlzT0IwSHFp?=
 =?utf-8?B?Q0g3VDlvNXM3WU9heFFVR2ltQ0JCMUNuSlRCZEdTMUxESEE1bTV6ZmljOTdT?=
 =?utf-8?B?STNSNjBDYkkrdWZVSnhKRzNOd3FWUXE0NThxNDJac2gxQm82VGI2UVNjSy9Q?=
 =?utf-8?B?QTN6ODNlaG9lN2l2WU1WWEYvamVUZTg4S0J3UmZqVDZKSGVXNGh1b3IrNitz?=
 =?utf-8?B?d2hsb2dOUSsySUFFS0J4SWFTV3M0cUIyQ3lEdjh3NzZFMlkwdjlYN0VscUFW?=
 =?utf-8?B?UVZhVThEd2prdTczcC9kNXQvYXp5SWoxaHZXYzZuZDBucnl4TVNmei9qT1Ba?=
 =?utf-8?B?dmsvL2VpT2psSmMxSXlKNThxallTK3d1UVVDUDQ0WDZNL2tCZnhxdEx6NmJx?=
 =?utf-8?B?UnZ5a1VkSUZxRDhXK2RHR2FkalpjMXBNV0t6ZzZHQ3BxNDAyeWNzMWhQZnFz?=
 =?utf-8?B?YmxZS1M2NFpmSjJtV1lkQWovd1FpYXFlRS93eG5KZmFzNUVJSXA5Z0ZyZzZG?=
 =?utf-8?B?Uk9pbGd0WHNLUk1oVjFnZFF1YzlPZjV3WW1yTlRBWnBnOUtHTTNMNjVYbDNT?=
 =?utf-8?B?SXJrRjVHT3hmNkJCek51MFZFaWc1RW4yVDEwVU5oOTczQ0lBR3NHMnhmdE44?=
 =?utf-8?B?UUNFeVVRbkY5UWh3KzFha1JHV3Azd2VvdmxNNEtNaWtqV0hhWEZnOEhhN2t3?=
 =?utf-8?B?NS9qUU5GUTQ2cGZNSCs3bDE2NFpJNFBFNzNBOXM1bXNOTFN3SU11akRVNjFP?=
 =?utf-8?Q?Ovss=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(35042699022)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 12:31:26.9951
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0ab998c-708b-41dd-96c0-08de30d58c2a
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A65.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11207

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



