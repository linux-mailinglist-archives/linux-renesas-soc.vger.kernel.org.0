Return-Path: <linux-renesas-soc+bounces-25265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED65C8E345
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:11:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679FB3B332E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:10:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CB6332ED50;
	Thu, 27 Nov 2025 12:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FdkfjWev"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ACE32ED35;
	Thu, 27 Nov 2025 12:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245386; cv=fail; b=DicCd0yqd2jp08tCTj5C/13QFprvvvUe5nGuS+gdy2uR+e106mmxEWrnLWZGGUvOuff0jQYKjv1+zqa58/3raQN8wbRD1yBzeZnfIqhIjAoWs029rKj/+9q22i7Qszn/BqFxobQkVs4UakQ+32YK9hv1WuRehir3Jg4MbcWaix0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245386; c=relaxed/simple;
	bh=JA8BA24DOlB0kdgU1DCPYZx4Zbb2m37f+qDUXzHjBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TlRyXqbNBGV+T7IOLeVtCTeBrJwWcXbDfJ0r0f/DUn4jc+G4Ae5UrEErHEpR5oAXpaMv94f+tLFFEbh5RsHimDnZi7QZi3ELuRFYGo5ryDMWzsTGZbMpHbFvzrRcXT91UO23Jp9gI56z0NSgefNkdjkVP69LnoTEIMOilnaWJVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FdkfjWev; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsoTm7Mfs0rQYRk3GzLcXc/+2sEejGkIJQU/ddhCP/tql6g7gjdwGFnHn8VKUopf8eeDxwkL971Erks0qFYsklRV3if9f0i7hzBSl8SG/cQTu1bKx07unK/Zgk2aebB86ihq7Psut4+OQs/OM/cRA7qe+grCnC1RxYpTb8HDPPpjZUXZGyFtB+KhnW20DCF1tBJlQRvB4LLss7KAyGQLS1dubIOu/GXQ8eI+X7ZzEwVv+RCZFLeK/JUyRIFRW5fl4f1k8LGxfM0FhtoBQyL+dH6B5SMMVbaGAqb648y6hujwdccbVxBrZK4Hd0M14cdPwiqjMYPAtFratKuCOTmwgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3yENuka94EdWv+IQd8DToNoQwxsFaNWjXKKaVV5jDc=;
 b=r8ux6TQgPxFA4JaT3RYGG0AelZNau5P6mXue6JMtGQqrYhdBgJY8NfNmwEKoL9ke/PIjnTwanXBV9AvDsTNcjUsB5cWO3kp9GHMks0IoZp8bFSHV6olk2x8QkZfchqYIFBO+q3agKgoBoxRXCBL8Rg8sPdvOpyW5Dcab1fY//EwKRBmri66O46jwHL66EW/SVNfDsx4OJQjvmMag1w4yV8nySkyxN5qoWO1ME/PKh0Fh4R26cX+2pmHb0drhXjkj7rV1ufX9G0d6lm+7G1Jr0+6FubphS2Yz6V3QxfAxu+3aktDGDv6508dxtMt9JvQOfaPBXo7CzTcGw1GlVSfAog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3yENuka94EdWv+IQd8DToNoQwxsFaNWjXKKaVV5jDc=;
 b=FdkfjWev5MchopBI63fqkRYQKud0R/8KUsjx/H7DBcatyg51Xr5o0EeZc4vqjplUamxw1rc6N4IAmMsgLiDbErgz1FGAszQHNDq70aVbJWsQS9a9r/Mwlb/Mp0uJ5p/LdakfrYIIQXicdV6TVZDDSV7ZAAYwZ2PFb41QpnlW0U8d7jmnGTQdZmAN2nNSL2RcAqjx7VLxGlcBG3JMj5Db3dGgJ7Ooro2vD8BTm/dvFQOAjHweYlsNGnlt+tZEtXnjzNMTdBxYz8NCO0P0JdRKBYKSeXKWQROSy0OjPpCaAby+XPlAm7sPW+RGsGQ5pLQR6LQmusIl0yD537qiM1NBSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI0PR04MB11844.eurprd04.prod.outlook.com (2603:10a6:800:2eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Thu, 27 Nov
 2025 12:09:31 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 12:09:31 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next 12/15] net: dsa: tag_rzn1_a5psw: use the dsa_xmit_port_mask() helper
Date: Thu, 27 Nov 2025 14:08:59 +0200
Message-ID: <20251127120902.292555-13-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127120902.292555-1-vladimir.oltean@nxp.com>
References: <20251127120902.292555-1-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VE1PR03CA0056.eurprd03.prod.outlook.com
 (2603:10a6:803:118::45) To AM9PR04MB8585.eurprd04.prod.outlook.com
 (2603:10a6:20b:438::13)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI0PR04MB11844:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8a4552-fb5e-4b5a-2048-08de2dadd1c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|10070799003|19092799006|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ris5Vitsb2JPK1F5TlNDN1hjQUJSZXMxOHJLaDRKd2JaRFlLNEVNdEsxbjhz?=
 =?utf-8?B?NENEQk4vdi9DMVJoSGtPeUtxR2FObFUvRW5SREhmcmUwbUdRd0c4RkpNa25m?=
 =?utf-8?B?ZHZPdjlrWGlpai9BVzdQVnAxcDcvbmxqQlZ2ZGhQek5zNlVHcklxOWtFMno5?=
 =?utf-8?B?MnM3YnMrVFBPZTVOZXJjRTk0T1puYWp5TFFXUkFTSGhjbTdEQVVPOFQvVmRD?=
 =?utf-8?B?emRXOFpaa2FRZDFta25wQzQ2UUMzemFUS2twcmV4V20rT1hWMG85VDNuYksy?=
 =?utf-8?B?M0ZwL2lVak1OdmJuSkc0RE5DSW82Z3VXb040ZCtVQTFxald0L2JQUElySURT?=
 =?utf-8?B?S2xES1NrM3NGK081clpxUGdMVnF2UmZjbHYyY1NoWi9kWmFzTUZHbXFUZFhN?=
 =?utf-8?B?NkZRZEpZVFBTZEFSRGhTeVlsS3B0bHgydkNXek1kejVVVjVvU0QyVnczd2lj?=
 =?utf-8?B?eXZseG5oNFo2SERVYllFcU1sRzVkTjRHM0dlandiZVFrUFJLZXRFdXFtTTlm?=
 =?utf-8?B?cldMdVdZS1lCb2N4SzhTeDJGVHJ6S0I2emdWaGljSVdHUS9KYUVrejhFSklm?=
 =?utf-8?B?MjlvdjVRYzZEbUwwb2VRaDFuak8wZytDYjluaERUT3NGdUY2aThmTHpHTXhG?=
 =?utf-8?B?MjRYRnUxbVNSVitDMENYUVFLamR1ZTFZMnY4dlo5YzVMeDFwS3pMTVNHN29C?=
 =?utf-8?B?NGhMcXQ2QWNJODFhVlVsTUlMcmptMVk2V0VNelpKRHROeTUxY0JLS2tqVnNF?=
 =?utf-8?B?YnlzWDZVNnpZVXNmU3BKVk1CN2hGdU9yeFY0eDdGbVJkOGU4Z2dpcDl5YlJF?=
 =?utf-8?B?c2tPUjd0RzhMcC9rVFk3Zk80Q0pnOHYzOE4xbDIvd1JBZllSSEhXeDdqUkhk?=
 =?utf-8?B?b0VVYVBqZXNRVDd1dm9ySDkxazlWT29FUW93Qlg5VVY4Mk1YSGdmS3NBVC94?=
 =?utf-8?B?Ujh3SG8yN1ZPRVZOR3ZPVi9FOVZOZWRwbWtlVnU2OStWcEYzSnlZVjV1N3lj?=
 =?utf-8?B?WGpSdUcvUzd1NU91U3Q1cmc2WHVqYW1jQ1RkdTA4QWUrYzVqbFE3M0IwM0VL?=
 =?utf-8?B?VFlWL0pjVHNnb01Lb0MrbHpVY2VvUXIrdHVnc0ZPRWZRcGRKTDlGeVlvbnVC?=
 =?utf-8?B?bERmWmQxa2g3Vmtvb21uRzd1NGNHYnlvc211TXUvVENFNFVtZUdGUkxvd1p5?=
 =?utf-8?B?emNnbUNkRmV2UUVleVJzeTZjQjRoOUxtZWFDWmlZSnBsbmJmOWhKRmZ1MDZF?=
 =?utf-8?B?U0RJVlozMU9WNWFjaTh0OW83NUdBWWRlTFdkYzk0SllxQnBkL0hMWnZ0eHR4?=
 =?utf-8?B?NW5MMS8xTXlaV29Jc2VsNlVPS0Y5bHJ4U1dQT3I5Z1dnOC9wNG90RjdDZ3My?=
 =?utf-8?B?SFVRb09LTXBuT1Y2Tk1HaXRkRjJmQkhYVVBodmF0dFpUVUdUV1B0TUZ5c0lp?=
 =?utf-8?B?ZjROam55M09KUm51Tll6ZXJ4QkxJNGFCM0QwU1hmcFIyNDBORkpoclErYXpR?=
 =?utf-8?B?N1hsSkhZb3JUVU1XVlMxS0JsV2VqRHVKWDZkekp5bTZyZHdwaFBlNk83NzVv?=
 =?utf-8?B?bC94Yi85aENSeVdKOXNuZmQ0ZFJxTDBZR1A0dS80cEpPekRPNHNPUlRqc2hC?=
 =?utf-8?B?bVZFdlBFTEJzRXRjdlZ3YlRXNXlOTUM3ZktJS2Fic0VQYXBYQ3V1d2tsL2Uv?=
 =?utf-8?B?MjRYVmc1eWUyVWJad0NVUHF5VUlsSE5kc1lOeWM2M0ZHY2pWd01aRkpTZ3dG?=
 =?utf-8?B?S3VWZVVNZXJZUGZacnFmN0J2d2FpVHYvRk44enU4WkpEd0FvS2xnQ1BCYU15?=
 =?utf-8?B?VmhORXZTd3NRaGNlT2JNUU1TOWdCTVVLNWczQzZqazh5ajhkY285TXgwNzJa?=
 =?utf-8?B?Qk90RTdNREZnT2ZLeXNXZ0tMMVlaMWlMU29MWDN2Szl3dmx5UXM3dEdJdG1C?=
 =?utf-8?Q?NquaztH7zhBXPZ8qwewAT17m54ktmidT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(10070799003)(19092799006)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzZFaDVYMm9IVFNELzVXbEMxWmVBL1dCV1ZibFdQRkE0VUhDbG5JQktGcWk2?=
 =?utf-8?B?MkJNWnF2TUI3RkFTZkZhTmE4M3dmLzM3R2pEOXdaZW9EdlRDUTQ4QnFEeVhQ?=
 =?utf-8?B?R3lLcytDVDVPN3RLbWZqRjIxbE92SjN6VWM4bUo0TXp5NkhOQm5xL3dIajha?=
 =?utf-8?B?alMrR2grQWdESTR4VVF2cVg1eXRDSk8zbUNlckJNaWJYVStHS2RtRXNQZ1ln?=
 =?utf-8?B?bWNJK21kWWY3T2ZBcWRESlYwQ2xSZmNYdms2bThtQ1pNSkk5c0d4UEFPV1R0?=
 =?utf-8?B?ZTEzd2U2TWZyWTNlempHdDVVTk9LaW0xM0gyeGFHRGJ0WlNVWkZVVzFZZndQ?=
 =?utf-8?B?cWZwaTZhajN5bGw3OGRFZEYwVm13aHB6T1RTMlI2WlB4akIrcnlDcXQwY2sr?=
 =?utf-8?B?cXB1dkQwVkE3eXRnUlZyRXVOUUdGVnNUT3EyQXRkaEN0cGlMNzhGMnpBSXk3?=
 =?utf-8?B?WFJ1L2R6QmlUWVV2RURCTDgwczNXb3M0NElLYUE5SG9idVQ5K2dkaU5yQ0p2?=
 =?utf-8?B?dVFXcFJ3SXRxdnFHcXB0WTN3dGhmRzdvd2thZHNLenM1cVJucGpsdnVHa1FX?=
 =?utf-8?B?c3JVYkpJeFBHbkUzSHFEWEpUQy9za2E2VTZrM2lkY2crL2ErdHdhNWYrVURm?=
 =?utf-8?B?UGdYSDMwbDdBZHR4ck9KYWJoRktsV3grOExpdWtabkNYa0NNQWYrZlkrOElU?=
 =?utf-8?B?VS91c0JCRm5mNTVDMGc3L0FUMndnMHBFaStkenhEeHB0VERIU0JuV1RqaE12?=
 =?utf-8?B?MnBiQnBEUEc0T1JmUEtJeGdjMlBRRTlrK0xUMEYzUllnaWpGeU5ESTUrY2sr?=
 =?utf-8?B?RnJ1NmFxS0d4YnpFbk5iZ3ZkZElRU2N6eE95VkFHUER2NjVkenNUSm5iWEVt?=
 =?utf-8?B?UEF4cUU4ZStsZ0d4T0dVMWFvUHNQUnFHR3ZWQi8rdGJMeG5yK0FpcXNSemg5?=
 =?utf-8?B?c3oxcHpZRGpjS3hoTzlGZytraWpFaHpxcVNnNTVja2tVcytjMXh6bXpCbGdV?=
 =?utf-8?B?K0NlZlJlTjFMVlZwY3QwUHMxSDNGMEJma3pKdmpqWll3bjIvM1hNOGlRbG1o?=
 =?utf-8?B?Q3VWZFh1YkUvbVRaRDdvcldXUUg5WGFFWHZCUjhaN2hVWTdmem5tYmZWeE1U?=
 =?utf-8?B?WWZMMlRCbkRJNWdRY0I2Umw0aDNhcHZZbWxpUENMUUJsaDBaVko3SDB2Y1hv?=
 =?utf-8?B?cy9UQkJ2NnFvSGNqQ2hnWGpuUW41c3NBREJYdFE0cDZ3eVJlR0pHaWpIelVT?=
 =?utf-8?B?RkxteTVaaTdkU2tpUklPdnZFRkZKWW9Qd2hKMWNYRW1zUE15L004aE0yWjd2?=
 =?utf-8?B?YkFheTIzYVMrTE85Z2RVN1RUdnB1Y085LytGeWJua1pRb0REZEt3ZDJkTzdz?=
 =?utf-8?B?QnpkOTNpYnVEV00rRjJ1QjUzZVNEWnIzQnA1UjBpYXhpZWJVcTBEYWQ2RlBx?=
 =?utf-8?B?Nk1lWk1BMDRJL0JHNVZyUmNIT01PV3VCSGgvNjBmVnZaeisrMDR5aE1LYWV1?=
 =?utf-8?B?OVJVMUJDWjRCYXl1WlpvSGJWSnB6SmplaWRLU3FoUFZpdHhBOE9tOWZkRGJS?=
 =?utf-8?B?MTZPTUdyVEFwU043YVZzekZEZVlZeFkycDNtZXV1dkEwNjg5REJtU3I5anYz?=
 =?utf-8?B?Z2M4cXk2VlZpS0hhQkNMZktFYjRMMUdxelQra3B6ZU9MeEdyZXduZE1qd3ZE?=
 =?utf-8?B?RWREUEdpRnk2RXlyRENtTFNZRDN4dHhZRk5PRnJ4enIzOVFTMXAxRCszTnpZ?=
 =?utf-8?B?OUdkUkszT25meHhsblpBQjBEd2VnQUE0eXNwdlo4MXpQWUErQnc0KzFlc3BG?=
 =?utf-8?B?UEdqczNsVkI0dzltWHNEWEFwNEV2SWRnTC9CSVlJdXU1WkxjV3VyYXMrT3p2?=
 =?utf-8?B?ZmdTNnhTaWptQjdGeWZCNlJaOEpCQjdaTWp4T0NxSEZQZjJObk9hUHA4YUxp?=
 =?utf-8?B?d2xzK0xmOUR4MDN4cXk5SkoyYnE4eGtXWFBtTFp3VzZNQWNpY1VnUUZZOW0w?=
 =?utf-8?B?WDBrbTBmTVpOSXJwbXNSMDdrU2l5OUJ3akVUeGhheGo5SW9ibDFzcm1RSVFY?=
 =?utf-8?B?SG9VUCtjYndleTdVOE9LdXFjOHpnaTg3TkpvSWtlbWdNK1lQNDVkdDd2OUY0?=
 =?utf-8?B?N21xRzFLVmQ2bHRRZ1FCRUxNN2NFaHpLMll6Zm5TWTdRL3prVnlraElnamc3?=
 =?utf-8?B?U0FNdFNjQWhZUWJoTkdjNHNuTm5WSk4yR2ExU3RyWHd0UkhLNStoeEZrYUdH?=
 =?utf-8?B?VUc1MFJINW9aN3NueTA2SzQwN2dnPT0=?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8a4552-fb5e-4b5a-2048-08de2dadd1c5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:09:30.6926
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtu8RfGEwmgTz9lLVQerH2wtwSVdvaE1OKhIn5OpC4Grzkmzdq2a/qsEe1y5AdphnOdTJUVmgO9dbAgya3tk4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11844

The "a5psw" tagging protocol populates a bit mask for the TX ports,
so we can use dsa_xmit_port_mask() to centralize the decision of how to
set that field.

Cc: "Clément Léger" <clement.leger@bootlin.com>
Cc: linux-renesas-soc@vger.kernel.org
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 net/dsa/tag_rzn1_a5psw.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 69d51221b1e5..10994b3470f6 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -39,7 +39,6 @@ struct a5psw_tag {
 
 static struct sk_buff *a5psw_tag_xmit(struct sk_buff *skb, struct net_device *dev)
 {
-	struct dsa_port *dp = dsa_user_to_port(dev);
 	struct a5psw_tag *ptag;
 	u32 data2_val;
 
@@ -60,7 +59,7 @@ static struct sk_buff *a5psw_tag_xmit(struct sk_buff *skb, struct net_device *de
 
 	ptag = dsa_etype_header_pos_tx(skb);
 
-	data2_val = FIELD_PREP(A5PSW_CTRL_DATA_PORT, BIT(dp->index));
+	data2_val = FIELD_PREP(A5PSW_CTRL_DATA_PORT, dsa_xmit_port_mask(skb, dev));
 	ptag->ctrl_tag = htons(ETH_P_DSA_A5PSW);
 	ptag->ctrl_data = htons(A5PSW_CTRL_DATA_FORCE_FORWARD);
 	ptag->ctrl_data2_lo = htons(data2_val);
-- 
2.43.0


