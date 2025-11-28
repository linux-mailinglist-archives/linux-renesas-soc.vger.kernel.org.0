Return-Path: <linux-renesas-soc+bounces-25333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF13C928DC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 17:16:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23982342BFA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Nov 2025 16:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 467182882D0;
	Fri, 28 Nov 2025 16:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="gTm0uuuk";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="gTm0uuuk"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023118.outbound.protection.outlook.com [40.107.159.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F6231A23;
	Fri, 28 Nov 2025 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.118
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764346581; cv=fail; b=OtHRy2YigHAEqOc6bcR0esVq7/JAhwhtwNlq1mDo/yQ4uLdJ5l3C5mPVZNH/BLtRDNMtrYkv3vtWTFHK6jBeAguvmIGjsU+IWqNy6ncjzL5Uyuz7QQ7P6ovTwUNPMf8zTjaJ3b9WA6TTcSgE1CxLBcx82XKXGF0Rn6PEoo9bOs4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764346581; c=relaxed/simple;
	bh=tshnmXNmo84qXIZb2n4TBLaGMJ6ABL4AAxj6isov9z4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Iqtp/pBtAg+zbWmxO0tHfZI60jbIGyoj8qRCvHHdcnqjQqOpzhVabGPdfWgC6ReO0a2CEM3YeMFUdn2dIb7C8i8rTltUE7ebHRw/Zspk8Ua7675bCX327IEVejvkpTz6XqcNbXHyk+3SXp3OZG9hi30x5nZN2be3j535y4y3cp0=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=gTm0uuuk; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=gTm0uuuk; arc=fail smtp.client-ip=40.107.159.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Z8rjtDB3ynumH9pA3Xal3XfYFuEeP7BYy40bOCHfrITE1RVWGBQKQPM+dDlscVpfioWbJtfqOq6JPg52Krn2JuhOWRdhD03jF62uKC+vaSmIPd9z78stJwX+ErrAqxVNgPDHIkgs8JsfepS5yre9+01/vCQlEjnvHhNJl5fn1wfmXyUI6ZXlRd6TR0eJjqbn9uCJR3hElhj/aFQEfrshM5/GSbQ9q9f0IMYW5jaDIAAL59AB2H1YTjlLWC0vU3fJAXyE3JkXE1MwY4ZXDjRi0Cbl6QRqhQ3jK3DBxxHVRyH1VOz3G93szkptQGAppxitqRIPF7/FyU8FZoEtwWRsdw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOM8mpcuTnC5g//N53wSJN2HsIOIXX6I0nznc2F7cS0=;
 b=BIcCvL1uuRxVR/Pg0ii05SNlm+rTduzwvJuX/14M6k69fWbObgVKqyqnzhHx4LcNti7CpuEhs9sN1vMgZOBx5VxzXcZDH36ChFugY4RmDxe3AHzRqhVni+nWXaFyJXPH5DkrhVQe+P1tJBCk1eIDSiV++CjUAgrvlOzB3ovcCgh4qR8qPeH7t3XQZa36BlQatWAMu9c8ehQ3igC5jDV8BiyT6ZbzAITBR0OoTWKJ8HfMncLgo1gCR2h4+0CmNTd7AsCtwAJ9PfI6coCjg74qRk51yKQqltUlMXS98PG/Ct6OgMsUq7R0mcdJ/9dt6m+ie6Au/kd2FGTGFiWEuXkQ7g==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=glider.be smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOM8mpcuTnC5g//N53wSJN2HsIOIXX6I0nznc2F7cS0=;
 b=gTm0uuuk3WOv0+YpuJnRjo+8KyHO3KywCU8NeUKRhIS/wlMtUyBktfqFfJHXG7rvbFe7IBL22r6/Qp7SJCAJdIm3NjRYKZrt0aR1UKgZaeJF59K1DHDpn23G5mSdw6hR+T2mcZyeFxjo/R0gqG0oobTVIo5yUgFxyvdg18WyoWM=
Received: from DU2PR04CA0225.eurprd04.prod.outlook.com (2603:10a6:10:2b1::20)
 by VI2PR04MB11171.eurprd04.prod.outlook.com (2603:10a6:800:29a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:16:14 +0000
Received: from DB3PEPF0000885D.eurprd02.prod.outlook.com
 (2603:10a6:10:2b1:cafe::ac) by DU2PR04CA0225.outlook.office365.com
 (2603:10a6:10:2b1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.15 via Frontend Transport; Fri,
 28 Nov 2025 16:15:56 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885D.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 28 Nov 2025 16:16:12 +0000
Received: from emails-9198590-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-66.eu-west-1.compute.internal [10.20.5.66])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id C31D68074F;
	Fri, 28 Nov 2025 16:16:12 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1764346572; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=UOM8mpcuTnC5g//N53wSJN2HsIOIXX6I0nznc2F7cS0=;
 b=G6O5wvrDL70jCETEdGmsvGn3Ira0RwfyG0fVaJUqku1chPiqkPn6q5BHMKkcuNnx75nK8
 ejJu0/7EoYXCeu4KDSriDz+LzUzwUR4buAMmo17U1+eKxu6VcsDfBD/GV2k26B/2P8MrMh/
 UaF/OFADgxBa+OlBuQJfDhUw7HID8bg=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1764346572;
 b=FVd9b8D/Nlb3uVstDntLsgUzhkqoZiLN9kNsy7wHW7EX2w8ZrKfkKpMNrUQnjy9LFug1V
 /3OnN09VgqRERjYcuK4RYJp20o5i9fynLQ+emxp2+ITGBHiOKV2iabQVQw0F7KPSPEnF/gM
 CEvr5TccI60BlomuqGOuhpmxN83Iegw=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cRtg73w2bxtOQuqgJCE0AMET0WtlF0lWNUX+sMkfr5w/3R89Gifxh9jw1Tl7uQBKVHEe9Jw8Bhnf7qJ5B6/KCPY7klVfYMObmDEwcO1kYWH1I93jDBbK/XVT4M8ugt4r7YPXTJa0E6LVMxjGApxvgEB86VEkF2ZhuQ2Jkbt2iYFm8gwZLefQz3iraVpP90s7PzMH4b2K5jy4jCeNyxaD1Z8q9O+rktNs5/NOa6V+2y/0mgcKz16h16XDOn/LkdEJ1jbLku9qxtZqASXZvC991R4Bd7LnszOGNQi4556QR4xcuTBgfkr9WmclWGTT6RAjP55q9FEHAGErXdiX3PWfGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOM8mpcuTnC5g//N53wSJN2HsIOIXX6I0nznc2F7cS0=;
 b=N61CHz3ayl8aO/MxSib1ZPjYB4qGj5L4PhwtsPrlTWsLgOCPDkJ3XknV7HL7FrlJyC1ahjoLviA5TYkwQlPw1NoChnrZ7JZSXETMrwGOAukygUSUrRBsUqIQhppdNEe9xRhxxxRcAh00QB5EplFNhHNl5oLeScLbTJPkZZWcRW9bWrbeaawoy6/joHLLkIx/Xe+4xIxlYm5aZxWXpJIYIUhJ/Ca3qp+qi4wjOJjZQuynGXMx5vU6/N9VSrAaeruKvSVpBKAz2H8/i46QgZBrMOfFP75UB6VH1U78n3koAY1+zeads2lDath/aJSwZ31/d2lfP6AXIeWJYwlRLA94oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOM8mpcuTnC5g//N53wSJN2HsIOIXX6I0nznc2F7cS0=;
 b=gTm0uuuk3WOv0+YpuJnRjo+8KyHO3KywCU8NeUKRhIS/wlMtUyBktfqFfJHXG7rvbFe7IBL22r6/Qp7SJCAJdIm3NjRYKZrt0aR1UKgZaeJF59K1DHDpn23G5mSdw6hR+T2mcZyeFxjo/R0gqG0oobTVIo5yUgFxyvdg18WyoWM=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DU7PR04MB11210.eurprd04.prod.outlook.com (2603:10a6:10:5b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 16:16:01 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 16:16:01 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Fri, 28 Nov 2025 17:15:38 +0100
Subject: [PATCH 1/2] dt-bindings: mmc: renesas,sdhi: Add mux-states
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-rz-sdio-mux-v1-1-1ede318d160f@solid-run.com>
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
	PAXPR04MB8749:EE_|DU7PR04MB11210:EE_|DB3PEPF0000885D:EE_|VI2PR04MB11171:EE_
X-MS-Office365-Filtering-Correlation-Id: b2d3804e-dc67-46e1-a9f0-08de2e997323
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MjFkOWVvZVBLODVjWTB1bVhzd3FTakpYMmdPSGJJY0xxZmZTWFAzM1VHZTFN?=
 =?utf-8?B?T1dSTEVRV0dpbm5nQ1BQdTdPSDc2cyttKzFEQzhYazlrSUFOai82VHlBTGFX?=
 =?utf-8?B?S21QUGhaR1g5SnZTaGp1dTV0OEhCVC82SExJTE8zZ0VucHVzdWcvKy9YYzhC?=
 =?utf-8?B?YmVXeEtkV3lhc0pMN1gvL1pma3ppZHhZcjh3c0ZFbHFUeEJwUmU5d2cxa0o1?=
 =?utf-8?B?K3V0VW9lbmQvVlFkSUJHWU9uaEMwVEhFQk05SEtGaTlmeUhiTU9CVTVxYWlZ?=
 =?utf-8?B?cCtmcmJrdWNrZ0t1YlBRaWxQeU8xVC93bVlvK2FzRkhhYlZlY2dIY0NWaTc2?=
 =?utf-8?B?S0RSRUU1NnVOek5mV1ZaSzVxRWhxbkxXSTI2TDU5VDNWY1llMStsL2ZaTEty?=
 =?utf-8?B?eXNCSldTYWNFSFdUWGErNFNHWlRIMXhrOWN0QmNjZkZVK1o5RzR4WHJ0NmlK?=
 =?utf-8?B?dHlRSER5bk1TVW50RngzQnBtODhOaEUrcjNxRlFQc2dmU1VCYld4NHhuTGtG?=
 =?utf-8?B?YmdvT0c3ZFlPdjVwYUpMWVdwNWx3bDlUODRMVWJuTURCZ3RYSVR4NjZEbGVl?=
 =?utf-8?B?b0FHZFlZdjltdWZ0bHhWck5iUnJvcUZXRVUxMVNudWNEMFRhV1RmK2ZWZ1Ay?=
 =?utf-8?B?UTM0KzAxR1JESnVKd3NsQmpxYzlZRjdMUmdNcVhML2R2VW9mdU5FWjJHMWtX?=
 =?utf-8?B?NlFycFhXcVArM1RSZ1lUS0Q2OVVld2h1Z3Z4aFZKMkMrYksrNWt5dWtJYm9H?=
 =?utf-8?B?WSsvMG03ZjBZbDZGN3gyT09nYXlLRXdOOERqbElEbnIxVTFhNE1uYTJOVEV6?=
 =?utf-8?B?OGh2SmJsNEFPR0FuUmgrUkpkZ0RJc2IwVmtrUlI2ZjVtQWJZdDZ1UWVIVm5l?=
 =?utf-8?B?T3JiWGFFVGh0QzQzTWNrQnZnL011UGh2b3NGeHU2Z2ExYktDVWtETTRVSzRv?=
 =?utf-8?B?VEtWY3Ard0FwR3hTWTM0ei9yalhwRVYwckJlZkJUKzNLOUorU05PY1NqdCtS?=
 =?utf-8?B?ODQrTC82TCs4c2RXN0pmTjZqOEM0dFVyaDNoOTZIeGtTamJYVnJOajllNis4?=
 =?utf-8?B?cGNER21yd2xNS2k1MGNiQUVMSVVQN25BY1k4NkRSOElGUHRVT2dHS3RqRCt2?=
 =?utf-8?B?RUh2SVpicUx3M1VYRVB2MW1XeXVRK1JHc0gzdTlIZjcyUFA4RGFsRDBWbko0?=
 =?utf-8?B?ZlQyc1Fkay9OeWJ1Znp3RWFoTzY1cDJWWS8rOXN2K1V6cFZJZ3dFWVArZSto?=
 =?utf-8?B?MS9CZmJIcjBudXNobmpaMlcwVThFN3FwaVlVWG9PR0ZjWWFoMkQ5RDlsOFRE?=
 =?utf-8?B?MDA2YXRPZUxMY2txd25wY1pYYVF4RGwzN1lXZW9aTGROa1VSb3c0UEJsbmlL?=
 =?utf-8?B?aXlvN01hZWQ1Z1ZuQXYzc2JFNm1TL0N3Rm5vN2dYUDZuVGRsQWhPcUhzRDFw?=
 =?utf-8?B?WHVGTWF2eFBncEE1T2ZUbVNaRXQyTERNYzZGbTNvb3ltclkyUk5DT3YwY3dG?=
 =?utf-8?B?dVhISGc3bndoM0xXdG95UmJMa3prRXBtYUpjdlNMUmVyK0NoZEdteUZ5VkRq?=
 =?utf-8?B?UHg5UTZFMlRCUTlWQldKWnRsaHN1QVNFK3BrK3FqQlBjcmhDdzEreFQvZm83?=
 =?utf-8?B?a29UK3h4a3FHRnVMNExpRENJYi9vTDNxdjI0NmpXc0pSb1c5SkFEOTlOT3l6?=
 =?utf-8?B?VjkvaWU2akdvK1pxQ1ZoaEFiaW43cWxXS3d5UVhnMVNSeCtSWVM2bjJPVXRD?=
 =?utf-8?B?MC9wRGxVWmxDR1doaWRHNk1ob0Zmb1NJeTRZVERiVVl3cnlDRXBkS3N2aWNp?=
 =?utf-8?B?VHU3cjJZTjdUemdvZWpXNWR2S0p3MUY1czA1TWdmRVZGZ05KVVVmdjRwU2ps?=
 =?utf-8?B?ZSsrMkFKWHdnYWVJUHFqcmR4U0NZLzkyWi9PVlNsVXdNQnFTU1dOMnUxcjZi?=
 =?utf-8?B?dWU4ZUl5Nzh3cURoUXV6RXBncWN0bEttL0piOXNHZlBoRjVLNTNjcGROV29l?=
 =?utf-8?B?bmI3QUgyQ2o0SFdFeThjODk4eDZ5a21JY3lHeHRlRmx5eEtjT3R0OFBGUEt0?=
 =?utf-8?Q?2cDD9U?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11210
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b141349085a54851938956612b8f2ad8:solidrun,office365_emails,sent,inline:b648773eeb86d04166af9a7a9fd888ff
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	311d0caf-da4b-4fb6-408c-08de2e996c2c
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|14060799003|82310400026|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWE5RE5iR0ZNSnF4djdYVDVLUWYvRE04NkdGQWdkN3FyZEYzNGhZeFNmTzhT?=
 =?utf-8?B?WldtbDA5TzNMN0h2OWNnTU9KSHNPaFNZQStIOWtCYTZWdWZNTXJ5cDZQbk5l?=
 =?utf-8?B?TmNDRFFCbVlJWXRydFl4SXk4V09VYUZzcGdEYk5DWUVEMll1aWFabWY0eGlD?=
 =?utf-8?B?NlZnajlTeThTSkhoU3IyQlpVVzNSbWUwKy96TzBRYmtram16Q1hXbjZIV2lO?=
 =?utf-8?B?UEhQanNyVjkrSnVWbDB2dnRsRFNVZ1NMUmUycDJ5NUt6dGRISWhnSWRiVDZ6?=
 =?utf-8?B?TDRCRGhqaFNMak8rYVhxUVYvRDRpTU9NTzhHbEFrN05uZGgvTldxUjQ0N3Bk?=
 =?utf-8?B?NHlOeGVOL3R0RS85ZUxTaHJ4MCtNV2xQODBqaVdNZWhmSjhoM1U1bkRwcHNy?=
 =?utf-8?B?a2xiSTQ2TmpxaEUvU3hicDNlMlNCWnUvRkt2c3Z6dHRWNjFaZHhsanNyL3Fa?=
 =?utf-8?B?UDVRbWtwTzhNaVNzdmJ4akdIejJTSzBkOUlmSjBuM0FSeU1FcU1wWXhsRzhO?=
 =?utf-8?B?Uys0OVZjcjRCclV5cjFUZWI4a0VyY1VYaEpDR1lVL2FsSFlIUWhPeU1pMkV1?=
 =?utf-8?B?TkxOYUYzd2FLRmlqTFFxQ1dCVmlKZ0JUQXRKMlhyL3ZYRThwQTl0VXJqMGFV?=
 =?utf-8?B?WTVrNm1Sak1oQ21ObWk3eFlNSGNxTzdVbmZzdzJRVExoQndYVUdhaFZRZnhT?=
 =?utf-8?B?QzE1dytYbWQxQ3VJKytpek01OXE0dTdTSTEraUFnZVpqU3dzQnJtSnNDeVMv?=
 =?utf-8?B?RHhTRW1DNTJtV0syY25xYktKY0Myc0NMOEZ2STk3OVFRNUJEaFJwbmhTUVFO?=
 =?utf-8?B?b0VRK1VVTjNMSEphajUwNzcwUExjRTVYSXA1d1lZbjNhNndyRFJ5SzN4MjBY?=
 =?utf-8?B?UHg2dlZWQmx1RGE3azFPc214bkZJWjhjZXduc0pZM2p6bXY5d0lpN0JWMUFD?=
 =?utf-8?B?bWlQWHFNcC8vb2xUd1JDUW1pUlBJUXFvbHVPWklMNVBpRVUwR1c2dFBQREs0?=
 =?utf-8?B?SGdpWXZza1RjK3BpOVpTeTM4M3RYM0Z3b3VMNklZbDdJRVE3aitvQ05Fdkl0?=
 =?utf-8?B?M21YNlZ3bXFWSG1ULzJIY2FLbDhsY0diSXRBc2pFbU8xMkFNL010WThGWVY1?=
 =?utf-8?B?dEoxckMvaEo4WEtCTzczVTlVc2VyZFpySXlnRmJBamlvUEFsaEhSTnUreGMw?=
 =?utf-8?B?L0lLY01JMnFBMHVyWXdaYjFkd2Zxc3lqZlhGcUdPUkdQQzdpZWorMTZ5ckZq?=
 =?utf-8?B?Y1VRaXhFWWxFNE9rMEVCL2hwdnVQeXZFbW95dmxKcmM0a1A4bytMV3UyWGFw?=
 =?utf-8?B?WHlqREErNkFac2hnZkxVanBQWGlLdkZZY2YxVndpYzVRNEF4ZnN5YVRmQkhy?=
 =?utf-8?B?TTFvVXdrWlhISGVpS29YSFJoTUJzR0R4bFhDY1BnSWUxcmI4cWl0MzVldE0r?=
 =?utf-8?B?d3FIbUkrbmdVbjdPcTFwUXpMVU1JZTVSTVEzUGFHMmkzL0F5ZUcrK0h4cE1a?=
 =?utf-8?B?eWZsWXVXWkVyNEsyWkJhN0dwNXBycmdtM3Qxb0FXWHZmVGlWS1ozcTRXUTRK?=
 =?utf-8?B?ZmlWVGU0Snc4WFZ1MG4xNWpkem1GTHE1YjM4SVJnTWtIa1RBVVJVTWpVd3Fi?=
 =?utf-8?B?YnpPSGtIS2JZU3Ftbjk4VFU0SDQ1K1lHU0ZFczVWK1hjNzNPTFE0bFBjbnAx?=
 =?utf-8?B?WUhBSmRKcGpibUR2MnZOQTAxczZCWjBRNGNCTloxWjRUbUxkdUlVbzMzdkhF?=
 =?utf-8?B?M3RvcWV0RU5lVGtpV01EUFJHNTg2bTd3cW9FMGdxbXdzRndMV1ZuK2FzODQr?=
 =?utf-8?B?RjlLUjJTTzdtVzBuV1ZzWUdSL0pIdFdHcENsZUUwd2c5Y1d3akZ0L1hoRWhF?=
 =?utf-8?B?QmEyb2U3TjdIOWRaaGRxc0h5eStyYXVyaVRITkpUa2doNEVnYkJ1cFFGSll5?=
 =?utf-8?B?bXFYb3NGU0FYWmdzMG5FNGVZaGRUeWt3cjlJZ0RiYXZhZmR6ZXdDTUF6OVIz?=
 =?utf-8?B?RHUvaFQzdys5bSs3M3VhMjAzNDRQYUd3YnBNakRPbERIRnF5N2JmOHE3S3NM?=
 =?utf-8?B?MjZOUjFSVERVR2ZXZkpFRFJxemdwcUNENVlDTkp0em1CWXM4Nk5CSzhWZjRO?=
 =?utf-8?Q?Z5A0=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 16:16:12.9320
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2d3804e-dc67-46e1-a9f0-08de2e997323
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11171

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
 Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index c754ea71f51f7..55635c60ad73a 100644
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
 
@@ -262,9 +267,17 @@ unevaluatedProperties: false
 examples:
   - |
     #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/gpio/gpio.h>
     #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
     #include <dt-bindings/power/r8a7790-sysc.h>
 
+    mux: mux-controller {
+            compatible = "gpio-mux";
+            #mux-state-cells = <1>;
+            mux-gpios = <&pinctrl RZG2L_GPIO(22, 1) GPIO_ACTIVE_LOW>;
+    };
+
     sdhi0: mmc@ee100000 {
         compatible = "renesas,sdhi-r8a7790", "renesas,rcar-gen2-sdhi";
         reg = <0xee100000 0x328>;
@@ -275,6 +288,7 @@ examples:
         max-frequency = <195000000>;
         power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
         resets = <&cpg 314>;
+        mux-states = <&mux 0>;
     };
 
     sdhi1: mmc@ee120000 {

-- 
2.51.0


