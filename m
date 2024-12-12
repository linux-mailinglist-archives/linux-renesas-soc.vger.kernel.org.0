Return-Path: <linux-renesas-soc+bounces-11249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3149F9EE128
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 09:21:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 76F7C1883E8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 08:21:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 072FB20C018;
	Thu, 12 Dec 2024 08:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="jGl5o31j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011066.outbound.protection.outlook.com [40.107.74.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B1126C01;
	Thu, 12 Dec 2024 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733991681; cv=fail; b=XM9seNcYMeZuVH8ZDwG3x/Dl9op0/k4KqSHy64Ldfa5uJPzDAIeuiox4uslwqkuub1Q6MJ8CfXKju2oMpRYTdPBKnnfqN4spF6TH6Tpvec9Cc2HtoWpquDK4QdDPW9vpxPN3oB39wbaK9zLWiERJkVP390jj44B6cFkN/QRZJBg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733991681; c=relaxed/simple;
	bh=qBpOb+qHzuG9uiHDpLlXgL1CL7Te9+2vfR+cm3bKtZY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZsY0Xs6vLH3oFmoZxzgxzloDCf1Z4Ipuex5L7pw7jyInqznARZ2mVzSeT/TqquC/cOj6L4F0cgRhJeiAUMrRhJ+5unD6AS/cBwCQv26N36LlFPrCDualusxL4zy2Q0elvzerKmN6ZD+4bmIZ1SDEvgmwNS5QDMTnd8JsRvDNvSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=jGl5o31j; arc=fail smtp.client-ip=40.107.74.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ka7lNK6QhoqAfhUSD3GRIK1BroZZ5V9tw9onx+dX8md0BcxeePvHHnzVmM+DgRUcpqnplbbEtwMR3IdFjSebgGKwfTE1AssvQsYPZ/AB2hGoJ0OSkyTVdIfMnMn0TE0KZwCKYyfm+p1Qu1V8sUKlqyhCeaL/dPd/z64kjyVFZbpunlTLFAMbEaMoVMUMbUNOMOFf+nKJ3QMRBXuw0+25QqxnZrsEw10SZegEB8LBItQhV99CIg/OUeRHpPu2OhnMovu7LOleAnI8F/KnYY09yzvA8f/3P+QjbBSlz2fVAVSPEL4IuFzlJPRKJC+BWSNzOikXWwU4R72ICLtjJBhYFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qBpOb+qHzuG9uiHDpLlXgL1CL7Te9+2vfR+cm3bKtZY=;
 b=R8+7KFE5dNYuoLYJTnC7ahoGECKhX+lIzPmdR/Qs/qoO/U9ELiiXnNg5xQfcL4tbLZfbHqUlsB7wUC4wx4F8jN3XoFPZXSe0vZ/6SBBLFy85l3nKAn4ZnaH6BkqWGrYiUIu/DzjfAHFsTD31/RXSC6b9rYw7/+DvkSlky0p1PGygioxIEHUod094BLr3qLJCYFcj5cr7m1cK6hXZqXnI2rrzVsYBUbZwC6RtTdeGzH1rjwWsstwt9kXq1uQsp6dx5mdXFyPITb4/e0gghJ5ZU8JiDFipw3TpEbsYkmS8j0dUCJLLS92tnZXpBHAHAPh1w2HKIH0S2hd6wsJm2PqZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qBpOb+qHzuG9uiHDpLlXgL1CL7Te9+2vfR+cm3bKtZY=;
 b=jGl5o31jVLuuBzUlid319ps4Th98mnVImebSOBaQNc3C8wHKpeicNbwel7+6bFDYBM26CEAWwXZ1Ip5yOTN8oMlupr090H23U87hI5haLrKELyHNT736lVDDwUddFIk0DgCIseHt6AGciTfmoRKtDJgyfcy07w3yFF4ljWxlZ1M=
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com (2603:1096:400:3a7::6)
 by TYYPR01MB7927.jpnprd01.prod.outlook.com (2603:1096:400:fd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.17; Thu, 12 Dec
 2024 08:21:13 +0000
Received: from TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155]) by TYCPR01MB11040.jpnprd01.prod.outlook.com
 ([fe80::b183:a30f:c95f:a155%4]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 08:21:13 +0000
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Paolo Abeni <pabeni@redhat.com>
CC: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michael Dege
	<michael.dege@renesas.com>, Christian Mardmoeller
	<christian.mardmoeller@renesas.com>, Dennis Ostermann
	<dennis.ostermann@renesas.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RE: [PATCH net-next 0/4] mdio support updates
Thread-Topic: [PATCH net-next 0/4] mdio support updates
Thread-Index: AQHbSYk5J1GiFYZP206aVROkSfqyN7LiRuiAgAADRUA=
Date: Thu, 12 Dec 2024 08:21:13 +0000
Message-ID:
 <TYCPR01MB11040172546CD3C37216A2736D83F2@TYCPR01MB11040.jpnprd01.prod.outlook.com>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
 <ee865add-5f30-4c7d-b14d-fbc693dba265@redhat.com>
In-Reply-To: <ee865add-5f30-4c7d-b14d-fbc693dba265@redhat.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11040:EE_|TYYPR01MB7927:EE_
x-ms-office365-filtering-correlation-id: 3d51171c-43d3-44bf-f38a-08dd1a85f0ee
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?N2JRaVlBcWhub2RJN2NwdXFFbkJRZFhMNXFrMUpHdnN4cVdIWXZJeHlCSlFu?=
 =?utf-8?B?MkpTS1BDVDRlNFlsc0d0S2lzSm1NZENQNnBSZzl0dnhyY0tFRjB6aXhzV2RU?=
 =?utf-8?B?emtaempuN09GSm1XaFNPUVhCSm5hQ2pPVWM5MFh5SjBnQ1c4SHd6cVR6OTNR?=
 =?utf-8?B?MWdyY0VReGEzdmc0KzFHbmlKNnBUdUZVL3E4RWFxR252U1FPZVlQYXdxNHNW?=
 =?utf-8?B?L3ByVTljekNTTmI1TVBQL0RhVHdXd1daaUhacG5JU01DL3luYVhnSGJiT3F2?=
 =?utf-8?B?Q3ZtOW1FeS9ZMllZbXFKR0t6Wm1EK1REMjV2b3F5RGNKRGV3NTVXN083WDJo?=
 =?utf-8?B?Qjg4cVBmQ0l6cWJzS0UwZUEwWWRkdDNEMmVKbjdRUGxkamxMS1pOWWIwTzFE?=
 =?utf-8?B?SXExQ2lNbFBHamhIL1RiMGhib3NLTlZZL1RwSkl6d2FXa0k2ZHA0bGsra1JN?=
 =?utf-8?B?clFpTk1aMlF1MUh3Q2tUcjVtdG9WQXc5a2pZMml4N01NTHZKOTlsZHdzMkxP?=
 =?utf-8?B?eDV4NFExbG1YbTRpdVBOQkhqeCtESnlncVpLS2dsNHZyZ1ZFUEZBenc5YjJJ?=
 =?utf-8?B?eXdhQVRJdk5pTmw0Nk52WEsyZURUMGVoZEo4SzZFQkJ0aXcxdVRJcSt5bE9Y?=
 =?utf-8?B?cldpQUQ2OWs2dEFQOGJYYTdoazl2eU9menI5QjlLKzJCZlBZUDdKS2ZOY0xu?=
 =?utf-8?B?V3IxQWMyeSswaEtEandLRHJWcnBoeWNkN0dFT25KYlU0ZHg1VmpFU1dtdkNH?=
 =?utf-8?B?TW1IVFNjbUlCenhYTVdUdVZJZTg4ampjYm1QTVpRUTlDYnl5alo0ZVJLL1BY?=
 =?utf-8?B?M0FLOVNTZE9ubi92STh6eHVNRGZZaVFyd1A4OHlxeUUzcjlTanZ2ajFMeUo0?=
 =?utf-8?B?THloUU80QXpSN0lIMkJLcmovMWNFS2srUWFUTk5PcitualVnaEVyckRkcnZm?=
 =?utf-8?B?MmtQNzRjeWFWZFVKdG43QjJLdTBuZmplazMwT2RoM1o2Ykk0YnpRK29mSkwy?=
 =?utf-8?B?d1BCZm05Z1VrcGp3NytHdGRYdUJYengxMEtqSkFxRUVmMEx4bm1JTzdYUjNs?=
 =?utf-8?B?aWZXc2hWQzN0bmhxdHduY2hZb1p5MHh3RDVabEdlSXgvZjY2dERsQmNlemoz?=
 =?utf-8?B?VENQWjdsUEQva1pscTFFVEV4a2JsTzdrcjIxcVI1TFBac2J0ZjdYeVNwUGEr?=
 =?utf-8?B?ZmQ4QXkzaWorTXdNUis3TDZGdTJCTFNNbUFxWG1uQlFOZ2dySFhJcXgyc1RO?=
 =?utf-8?B?Tk1lTzN2NmNHcEQzRHlPNWE1ZFFaK3pSaURTN3dxK2MyUWFRMXFHYmdhdWZw?=
 =?utf-8?B?R1VHbkU0TDFVR25nN0dGeG12TDN4b21lRFFpQmo3bW9mdkdXNjZ1dE5ZS3N3?=
 =?utf-8?B?dmo1YkIzeGhURUxUaUhydzQrRWZZMzdBUGtDY0c3aTczSmhxQ2I0Rzd5aGFC?=
 =?utf-8?B?c3dkYm1DRTdUVEw1b2VJbzhiamxDR0NUZ2c5TVJ1V05RMDFoNXo4UGk5VUhM?=
 =?utf-8?B?eHk3a0p0OURhTmRqSGJHQmc5YXFNRmdCUzQ5WjJNUXJHR3ZuTFUwMW5iN1k0?=
 =?utf-8?B?bGI2UHR6SitiZVRRWmQ3Vm9ZTGVQVExMazRsM0JLazJkQUdwc3pKWmY2WWtT?=
 =?utf-8?B?TUtIS3creWU2RisvNE42K3YzOTBoQVN6bnVoQTJSTEF2LytVYkVTalNVbHFG?=
 =?utf-8?B?VDFzTTdjcUlDV2MxWXQ5Vkx0T0tRazZVVmIzRFVOSGVwNlFuWXRsM0txYktu?=
 =?utf-8?B?cVlpdVErTkhmRm1leS81T0FKSE9rWGlmS2QxZGZqTUYxWExmMGV2YTBQRko1?=
 =?utf-8?B?UVdXd2JlazdFOW8wVEZUcEdTQ0dISHlyVjBWVWZpQ0dIckw1ZWNKSWdZb0Ji?=
 =?utf-8?B?dmQ3WUM5c28zS3VRZWV3dkFkMStpWDQ0NVVScnVRR2JOeFE9PQ==?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11040.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eFgxLzN3Q2U3WFQ4R1RoSE9RR25BNmdqWlkzY0J4SEdhekJvdm1QRkpTdEwz?=
 =?utf-8?B?bG5sUk16ZFRxM2p1N3N1YVgxVlRCa3hMb3lPOFI2SDE1ZUVScnptYUdBM1hH?=
 =?utf-8?B?T0VhR1c2QW0wNGJQdGRpN0pyWldrS2hBNXFPOStSZ1ZRL3hiNUdrSG1UekRL?=
 =?utf-8?B?YmZUZTRoaVZLM3ZYMytnVWMyc1BWWjd4RUdKZGhKYkpPOGFMaks1M2twaXhj?=
 =?utf-8?B?N012T0FNQUZROXZ5TzVXR1JCbWlMVWRoTzYzMDd2Z2dUS01QSitJOUJoRkxX?=
 =?utf-8?B?cGZQZmxqRlJlbnYveDNNdVc2bk42OVM0VWpLMFFmYUlCSjA4Nyt5b1E1SkhN?=
 =?utf-8?B?Tk9FSks2eXBCMzNwVzFlYUptTmIrVEFNSVNwYndMTjExV2ZEZDJkeWV5M25Q?=
 =?utf-8?B?NjZKWWQrOUtxV0RHQkFDci80MFRRWTMzZnE5OGNmOFArd2pLS0wySlpVRVJ6?=
 =?utf-8?B?OXQ1eUk4dHp1aWlEYkhBR0pEazZiSUZ4SUIwbC9lUlBFMVNQNEhwb2YvSmFj?=
 =?utf-8?B?eVd5K0tEN05ER3lxeEZtQU5rTTR4MzYwU054MDRVMS9HbHVDWGZOakEvOHEz?=
 =?utf-8?B?MUJqeVhjelpGbEVuTEpvUUhMTThLSzNRbjEvTEg5MVRId2RyVzIvb3NYN0pp?=
 =?utf-8?B?L0dIRW1FRGNDS1RMM0NjZE53YkdkeXVnOGdKOG5BdVd3ZERZSlViSHpUTE5j?=
 =?utf-8?B?UGg3NjkrWDhUWTFUSW5IOFZGcEhRMkd4dEViY0R3Z0ljR0ZXSkc5RklqeWdo?=
 =?utf-8?B?Nm40UlZjWkxkcXpZVkduMXZqc3RjdnBXczRFa2NnMjVUVGFIL0lSMC9BaTF3?=
 =?utf-8?B?OUxOTkpIU21vK0tHU3l4MU1jdmswRTJmdzV6UG9mQnl5SVpRb08xWXNvWVRB?=
 =?utf-8?B?Nnh4KytkTnk3SzJuazczRThqK1BINDJCcU9OMHN3U25DR1B1MzZ2dW9rdWUx?=
 =?utf-8?B?OGpqMjJoOW9LKzFrZjRpYUc0ZXpINGV2cjNQaEQ0YzhRd0tTT3ZTZFRvUldm?=
 =?utf-8?B?UWxrS3ZxZ3h4aDRZbjFmY0NWeVpDM2NyN0Vnay9UcXJNMXZmQm1HZHpyb1Ru?=
 =?utf-8?B?a1R6UjJHTWphRjFhYkYzR05VbFZSWFBTQW5aVEMzRXVhZzNyZ2ZSS29Qazh6?=
 =?utf-8?B?WTZsUjVlcGRsY2p2TERlUzUrdFNZU0dTYVhiUkEyT2ZPa20wa3k1VW1zaGFH?=
 =?utf-8?B?OHpiZ3VmMm1OZzlDYUd6ZTFyQWFJZzFqdGI3ZFJaTllicXoxbXIra05Mb1M3?=
 =?utf-8?B?TUFIU0IxcHFsU043ancydUZycGhlYjBtMVZTaVJPbGw4dEZYWE9BNWRXY2ww?=
 =?utf-8?B?cUcyOW42Y2Vlbk1hdDk5YVZhTFVUVkdwcjYrWjRFQmxFNDBOVmg4am8vQloz?=
 =?utf-8?B?bWJWRXJOd3dwcm4rNHd2OWlZN3VjYkdIUEM2RkdNMlhNTG84N3pRZFp0NnNX?=
 =?utf-8?B?Y2pUbE1SanBXMnptRFBSaVJ3VmtKdU50b3EvUGtXOTZwUnlBdngxaHdId1FK?=
 =?utf-8?B?ZTdYaEdCSmI4WUJScTIyRTJxbXJ1QnNCQlJvMVM1YkMraHVPR21yQWpqUGxF?=
 =?utf-8?B?Ty9NNlZvZmlSSldmRUNDU3M2UmFHK3VPd0QwM2hlTVlPOFV1bkhEUkVNT2h2?=
 =?utf-8?B?SDJ3OVVHdm9UdG9Fc3M1VzFGc2g4RmpLS2g2YUoxL1ZGc3lNZWEzOGNyVnpG?=
 =?utf-8?B?QWpveEg1MnpZVGFQUG5MVjZZZnBHaVc2WGRPVTNHT204TDRRTVZZN3ljUm5F?=
 =?utf-8?B?c2NyOGhCcGNCY1F3aC9hNGpjL0NIdkxmRERsejdyZzY4bjFkbkkwaUtGQVFx?=
 =?utf-8?B?eHZ4Z1lNK09uc1A5VU9ObGtHbEszL3NXNWcwT0VSMVJGdTFGNExNNFlNOHlK?=
 =?utf-8?B?OUhmLytWckJJMFMxTDJSdktwNTh5L1M4cmZkY1QxZjArOVlNZDZTM0dHZmJt?=
 =?utf-8?B?c3BRRWtDV0QwdUxKNTZDRG9ZQkR6TnhpemhuK05zOEwzQ1plQUlrcmdzYjli?=
 =?utf-8?B?dHVNSDNpOW9oTjA1ekdNUVR2U2J0MFJQN3R6VkMyTlR5YVBGbUVNVGxRWHUz?=
 =?utf-8?B?QnFxQkVORlVaUjVETG1vWmtqWm9ocU5oY29IS1BodHhjMkZvZEtRSkI0MCto?=
 =?utf-8?B?SnlrWHNvc2FkYXJtcXNMNDBaUVZEMC9TRjFOZmZ1TElHVklZbXlySmw1WTRX?=
 =?utf-8?B?eHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11040.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d51171c-43d3-44bf-f38a-08dd1a85f0ee
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2024 08:21:13.1129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: voIIjovkXmobAn86MwSWKLWbyVvFOVTDWaPKyBO8Z8wwM7wY4eK0hkPwxxXSFHu9FG7Bhh7uw/m6TVqG5z/FYSRPffvKelQ8m2GlHirrPMNVFP9HhNKeNmBOcT7WhRR0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7927

SGVsbG8gUGFvbG8sDQoNCj4gRnJvbTogUGFvbG8gQWJlbmksIFNlbnQ6IFRodXJzZGF5LCBEZWNl
bWJlciAxMiwgMjAyNCA1OjA4IFBNDQo+IA0KPiBPbiAxMi84LzI0IDE2OjUyLCBOaWtpdGEgWXVz
aGNoZW5rbyB3cm90ZToNCj4gPiBUaGlzIHNlcmllcyBjbGVhbnMgdXAgcnN3aXRjaCBtZGlvIHN1
cHBvcnQsIGFuZCBhZGRzIEMyMiBvcGVyYXRpb25zLg0KPiA+DQo+ID4gTmlraXRhIFl1c2hjaGVu
a28gKDQpOg0KPiA+ICAgbmV0OiByZW5lc2FzOiByc3dpdGNoOiBkbyBub3Qgd3JpdGUgdG8gTVBT
TSByZWdpc3RlciBhdCBpbml0IHRpbWUNCj4gPiAgIG5ldDogcmVuZXNhczogcnN3aXRjaDogYWxp
Z24gbWRpbyBDNDUgb3BlcmF0aW9ucyB3aXRoIGRhdGFzaGVldA0KPiA+ICAgbmV0OiByZW5lc2Fz
OiByc3dpdGNoOiB1c2UgZ2VuZXJpYyBNUFNNIG9wZXJhdGlvbiBmb3IgbWRpbyBDNDUNCj4gPiAg
IG5ldDogcmVuZXNhczogcnN3aXRjaDogYWRkIG1kaW8gQzIyIHN1cHBvcnQNCj4gPg0KPiA+ICBk
cml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3Jzd2l0Y2guYyB8IDc5ICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tDQo+ID4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcnN3aXRjaC5o
IHwgMTcgKysrKy0tDQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNjAgaW5zZXJ0aW9ucygrKSwgMzYg
ZGVsZXRpb25zKC0pDQo+IA0KPiBAWW9zaGloaXJvLCBjb3VsZCB5b3UgcGxlYXNlIGhhdmUgYSBs
b29rIGhlcmU/DQoNCkkgaGF2ZSBhbHJlYWR5IHJldmlld2VkIGFuZCB0ZXN0ZWQgdGhlc2UgcGF0
Y2hlcywgYW5kIHNlbnQgYW4gZW1haWwgYXMgZm9sbG93aW5nOg0KDQpodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvVFlDUFIwMU1CMTEwNDA2NkQ0NzA1ODY4RUVBNDQwQ0UxM0Q4M0QyQFRZQ1BS
MDFNQjExMDQwLmpwbnByZDAxLnByb2Qub3V0bG9vay5jb20vDQoNCkJlc3QgcmVnYXJkcywNCllv
c2hpaGlybyBTaGltb2RhDQoNCg0KPiBUaGFua3MsDQo+IA0KPiBQYW9sbw0KDQo=

