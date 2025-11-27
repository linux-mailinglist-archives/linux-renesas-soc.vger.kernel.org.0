Return-Path: <linux-renesas-soc+bounces-25263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA05C8E307
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:09:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5B37D4E25AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:09:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82A06315D29;
	Thu, 27 Nov 2025 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EszJyl8Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099B932ABEF;
	Thu, 27 Nov 2025 12:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245366; cv=fail; b=XpSB/OzWWifM4qnm9KIejpVtmvO4ZQvkb4z/lQ0ouvPL1lF2BKSkxZWgIeNp/Kp6+TDfjzLQKRjcZ2Z4Ym4AB563fQLD27VXI4KZ1/2bogqNDJy7TRbQ7gIVEU8XBktR3QO2J/Js6oOvgcIEdzOKBqHZs9w60QP5e4Vqk+AABxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245366; c=relaxed/simple;
	bh=pdv9AErtmfjSeyjJOvdRf3uzIwLKla2JeSz9vWwXG7k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZPCTsFmhLv/8EjJNKKF6FSyoteHVKqnyX2WdNt85kZtE75dUkPdty6IGyj/qEqLTtSaKsivLOzoh5ulW2/dmdcRA7qlli7ltPKeUV7+7kSWF/Mwf3l1jo0NuYOvzWhpB57JwCVeBhoA15+1OvSSkSCXOkUi9LG3zDabfQ5VAywI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EszJyl8Y; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pf9ihoF2jThTnyvWhLFykPBdyB3LFwIogHlPIiUCdOo8uYnTj1S09vYnTkR4dYWQDVYCuM+hIWjlcM4o664EQ2ddwTGBwXocveDMOIVfeXi1gL5mr4m+PF5G9Fhd3LrlR/TJVrwERtOZcqoYolM3tKzrPiaTpFAC6ekOkoehq1hJq6pqHX+Rqr+QNNxBLmPO3cOZz8YBc77r92QT3pp43ZpO7+fAaWK8CnkrIwtLQQLT5+quuR7Mhx1kQiYgDTMExZ7VV30mPVM1eBedEKvC/ph7D71K4aR1QUTkASyMaxKvoOZOJ5wn4594Ytlil3mWkA9n/vd/+KUe4wB1FvABHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luyROCe+0wMJBGy2prCN8pAMZrtjj4box6HWNFQ0sVw=;
 b=SX0S/re2vCPqmXls6A2x81fDfaPVfgabsB23CYUXLLVgxG51iODdOfbs4hwnCusvqtOWcvJ45WMzH4TZ9RQh0q9ULAnyeBMWOFBPvN2eQyuUMj/sSWYjUcWsPQ31udWZEY+pHyl26Ujhf/uwDii01jNd+eVDgHm6dnP3HIo4bkZ/VXpuyC7dbWovaZFcc9Slwk53sBpImC+Y5TijuaHhD/nJ36+QLaaxADtceqTV9XEZXobBOlc/xvf5iiDVZXhrIY0RpbahVrGxT3eJUFnWENeaie5l+duwso4jujS+zEnGFH/OzmQUhRqwyRPoRTx63UxU/vf79Yu5wTFPCRKCLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luyROCe+0wMJBGy2prCN8pAMZrtjj4box6HWNFQ0sVw=;
 b=EszJyl8YZv1vGu5yzId36bZ3fGkdlQsgk86vb/3ElLo42Rl89PHz/YCb3yvW7x4SBVNdnGhAqn08IB5PTansl/CSFiHH1XW4yN3eC4qacjk2J9SJtAS+dXrWK5U7dM4ubtOe05NN0HhF2tlLaphXpq/4m0grOWVGeesdMPaZFG2H8etoj3v9ys9OMxypsh7QOtdNJSRvvfI1VvGgqExWgYAq30tynkwMSznltPLjMDAdTtv8/8vIpiMp24qoUH9uxfbfzLntrjMWq+4y3MCdKwJytvCXQfmZZ4P2Sm/DWK16bKHiemIhKNbc2yltrlOFLreOW/T4tOM1Iv+E/CqeJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI2PR04MB11196.eurprd04.prod.outlook.com (2603:10a6:800:291::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 12:09:20 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 12:09:20 +0000
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	David Yang <mmyangfl@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	George McCollister <george.mccollister@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Jonas Gorski <jonas.gorski@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Subject: [PATCH net-next 00/15] Introduce the dsa_xmit_port_mask() tagging protocol helper
Date: Thu, 27 Nov 2025 14:08:47 +0200
Message-ID: <20251127120902.292555-1-vladimir.oltean@nxp.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI2PR04MB11196:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f9c85d-dd6e-40dd-e44b-08de2dadcba6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|52116014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmhUOEhXUFQ2VlpTWmk1UHhlTlFWbmJrTTFsYVM0NGwra045YXlXanVxUTZ3?=
 =?utf-8?B?dlZRMjZiS3FGRTF6UTM2dzh1RGszK3IzalJaeHVBVStNb0ZCVlQ1N0k1VjQx?=
 =?utf-8?B?VUc5Q3hJYmtzei9ETEpnL0RXajVwSUlkWExPOTlOM3ZucTJTWXBtSFJIdTVD?=
 =?utf-8?B?T3ZsNmpGV2RGWDdIWlBFSHlGdGk5S1hXaHk3L1IreXBXZEV5KzhWTHRCMFRk?=
 =?utf-8?B?Yk9DMUljRUlpTHRRM0hsZTM5MVVoNWY0a0NFZHlpRUJZYkljZkxWU05ubVpl?=
 =?utf-8?B?QndkQXJ4R2YzRjZ4RlJHdCs0dmpPTllIWlkyOWhvVEtXSjNMRUxqY2VKV3hN?=
 =?utf-8?B?clZuOWhtaFlib0tSNzEwODZYTzB3M2dab1lzSGxYRUFOTXo4aWZ4NHZJTnFv?=
 =?utf-8?B?Tmd2TXNuYVFGWFFXbW9qek5rS1JlM3FLVW1vbFc2dU5qVlAxa1hjYXNPRk00?=
 =?utf-8?B?RVliQXQ1cGFkQVM0L0cvQmNnUk5Sb3NESWpDVTljNm9nOGt3cHhFWDBscHBP?=
 =?utf-8?B?Y3BYWGdGL2p6cjdROUMwb2JUREl4TUFEeHdSb3NVZTBRZ1Z1em5sWm9OcDlS?=
 =?utf-8?B?aTZ6WlpvcFpQclpicjA2TUluMlBqNjRVMVd0dWdneEdTYTU5eEk5RlBYWG5u?=
 =?utf-8?B?SHhZMlVzYWxDRkdtcllXQkpuWE14TnVnTTJ5M0x4ZHh5b0VLV3JKK0YxdGZB?=
 =?utf-8?B?K0FEUVpTc2hLM0VpZGZpbEZWT1Zoa0s3MWtqeGdaRlhKTXdMeTliY1VIWDY0?=
 =?utf-8?B?UzQ3VUswL3hPV1FOU3FUbWVORjcxcDR2ckxqR1M3R05SSkNscWRHNzF2cnYy?=
 =?utf-8?B?QmFITndycW9Sb1BFQmRFK05XQ2VHOUJsN3FQbjhrSmFvNU0zLzBnUEY3bS9u?=
 =?utf-8?B?dkJTZ0FSRTFLRWtTUU5SM1phYmlNYWN4Y3p5YVp2UWE1dU9xeTRTV211MkRV?=
 =?utf-8?B?dHBSRm9VQS83RFVxbTF3c2Ria0pIa0lpUEttRkgrTXpYWjU3TmozQSt4K3pl?=
 =?utf-8?B?Zmo5Sm9HTER5WlpTbFZpNUN1SmlnMjZUTjFVcFJqdnBnNm8vWGk3V2NtbUxY?=
 =?utf-8?B?U0hDWjZtc05COWtGSlhoVjVQNlZmeVdtWGgrbi9IR0R5UE1HbXZoSTB4Y1Ar?=
 =?utf-8?B?dTk0QU5STUtGSklpcktaV2E5RFZVYUw1TDd6bDVwNlg2eDhjOGZvZVYrWGcz?=
 =?utf-8?B?Y3hQekxjRWZHaUhtOFFjVGgrcjFQZWthYWJyTEEvTU90RVZtQWZRUkQ3cjBX?=
 =?utf-8?B?d20rL2FUYUFGWTErTkdUeGg0bGxJVGR0S1hYcDd3cVhsMTZNL1NJT2ZPTnk5?=
 =?utf-8?B?aE5UNzJmb0lJMnlYZFpha0dLSFEvUnVhaDFOVDJzb0lHZTlDSHI5a2VNUUNQ?=
 =?utf-8?B?UmlFUGQrV1dlbk1UMmQyN1hrNVJ3VTlRZ3B4T2hYYzMxZjNEbUY1S1RnSE8w?=
 =?utf-8?B?Y1FnSDhRUFZvdk1ycFVHQXlEV0x4cFFaYXhERFNNa2k5WThKS2JYSmE2UmVh?=
 =?utf-8?B?VnNhSEdsU1ZmZ0xXeUtGL0ZzQURMZWZYUlNjVVF0ZkpXRE41bnB1QVhiY2FB?=
 =?utf-8?B?RDBYK0kwV3FnWjNJKzRNNEd0ODJTVit3WnBQeWVoWHdlMk9ZanhsOXZGbDg0?=
 =?utf-8?B?RW9ocGM1NllGb28xYkJzZEgvWGlkNWNxWUFyVEI3WTJYZW1KM3ZwRmJkTjZO?=
 =?utf-8?B?ZjJwbUhEbVUra0NjMGNPU295UXlKSVpFWVpsc0NkOWdKOXpmQWhyMm9WL2Jl?=
 =?utf-8?B?UUdVRXBldzk5a01yMVZGR1U3b1dNMjZOdTlPRDY1d2E1T2JYNm1Yd1hKNnZk?=
 =?utf-8?B?SzdFeGRXZXZVR0sxaVM5VkJleml1WjFrUUFBMVI3cXVUUjU4L0RCaytjNnJq?=
 =?utf-8?B?T3BDS2NWV0RIMG9rSzBzQnVsTUxZUkpCejJocnVvb3o0NjNuN2pzcmY4MXZT?=
 =?utf-8?B?UzVDODkwQ20vNTArQmtILzJEdFVMcWVDTDQxQzBLSEtRRE1jMWVFeGNCZ3Mv?=
 =?utf-8?B?N1NKYk1KbUJBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(52116014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmRISFB3VnhQL2psN3F2Q3lMRnZVVGtLWE5jUTB0ejhKbkFUblNsbG9sYkc4?=
 =?utf-8?B?dFZ4bDF5aGlid2NucVVqRHdKZXpsdktIQURPOWE4bkJGS0ZXbG1jVXdoeVh5?=
 =?utf-8?B?M2tsT2o2QjNvMkZsSS8xcmg1ZzRIYzJoS3JzSG9MT0hVdmFjdXRmUDRMbndk?=
 =?utf-8?B?aXY5QlZGRjY0MkNtRGZoaXlNMUV0alFiMXlXUkpNazJpUFJ3U3ArQ0U4M09v?=
 =?utf-8?B?OFhuTUhsaWprRVFZaFdWNGZIUXdOREpuTFBDZGtQMUt0OFFLell4OWpPUkpP?=
 =?utf-8?B?L0xtSkpTSmdaN1NGUzAvaXRLUTdxVmVOZGswelVFb05IQkREVXY5N0R3VVIv?=
 =?utf-8?B?bS8veGJzUlh2Mk9NUWZwM3JwYVd3NGR2S0xaYU1YUE1ZRytWcnJ6T3IrVTJ2?=
 =?utf-8?B?aWZPLys2UkdDN2xNWWtHVDVCL2xsMGF6dDhDQzJoYW1CTUNEMEx6bWh0NnZ2?=
 =?utf-8?B?dmQwL0x4WVRRWUZ1dnFncUcwQ1JsdGV0Vk5VRDc3dFRYNFFCV1pvVEwxbUVQ?=
 =?utf-8?B?UnA1YURlMi9kQ2pLeHlweVpXQVd1Rys0V0JuUUxNY0pQVEdNYkZEWFQ2cEVL?=
 =?utf-8?B?RDIybUdBOVVWazEwS21YUkx3N3BTeDVFaHlVWGhEeHRhTWZ1bFc2dEhrc1dX?=
 =?utf-8?B?Qmg5SGlYSDlUNU1WbVlHOEZaTHV4NDdhMTNXTzBnV25VNStGQW5xSFlxMWcw?=
 =?utf-8?B?ekFNNkRhTHMvVldUckdKbEFWUkY2akdZV1RKM1BrZmdYY1JkdXdMR0NjZENM?=
 =?utf-8?B?VTBOMWVxZzhNVlZWaW1LL1FLNXhSTmY3amU1dGJLV2FyQk5EUVJLVUgrcmxF?=
 =?utf-8?B?b1RZT0lYeDE1RXhLa0JjZjZwVGdTMVJCdTVQbkpNZzV0bHR1NXZ0b003dFVr?=
 =?utf-8?B?QUl5RXZqTVFtbWVKQjRmOEZHcmlXS1JuWjZwNHdKaFVzZ0IxeElpNDRXQTg4?=
 =?utf-8?B?QWlMVjJGbGdGcTVSQ0x0WC9Qa3RsZDVlamwvdjViVnVLM0hJS3BKZzdLWWcr?=
 =?utf-8?B?NkpicUZtcXlOMGVjb3ZXYXd3dHYxeStJQWwvanhOcGlMK1BrRVdyMTd5UTdC?=
 =?utf-8?B?bk9uQUtVWkRJd2Z6KzV2bml3VFY3Q2xpbjFIdmxwbkVEbzhucGtYMlhJWTgv?=
 =?utf-8?B?Njdvcm9CQjloZFlwOFBnSURBWjhTc3VQVFprZjdxVDI4c3phaitZVko4ajQ3?=
 =?utf-8?B?cWJlaUNjRndGMnI2aFdSK1ZFUVVYQWdDNEliZjJHSDF2NGhudnFmZnIzZ0Fi?=
 =?utf-8?B?ckVzVVZpSXM0NjdocUFIVGFDVWNpNURWNFBBUnBIOUhaOHd6WUZ4MWM3N3gr?=
 =?utf-8?B?UWYvMXB3ckUyMXdZREJTcVRlL2lydG44QWFQU094ZXRkd01HdncrK0hTbVFk?=
 =?utf-8?B?MVdGN1JMY3VQQnRxWE9PTVBYUlNKTUFobnV2cmpJTkVoM2dYYVNsdldndXJT?=
 =?utf-8?B?VldmL204QWh0b1dURmVwbGJ5WmdTR1o2WVo0Zjk4SkVFSHJaaitLaXB5QXox?=
 =?utf-8?B?SWF0NHF3Rk1Qemd0dWxHZU1odWV1ejFsNnh5RzJpWnpvVFBUMHZSeFpMY2dO?=
 =?utf-8?B?ZjA2ZVpmeGVCRkNtL3EyTm94UmxMZkNQL2lvVDFCWkNCenlkZkI3RDNwWDYr?=
 =?utf-8?B?VVBhZzdON05hQ1NlUzU4Y0g0TXNudzJHcWJkSFhxZGM1d0puMHhuLzV3T3BS?=
 =?utf-8?B?dENRWmQ2STdySEhJdm9FWkFWTnBVUU82alJFc1JXSi9zOVRmRlpKdkdqYmM3?=
 =?utf-8?B?SFZQSFc1VmcrTldGVDBWZyt0RXBKVDJQTjFKb0dDWmhlTG9xWkovdXJhWWti?=
 =?utf-8?B?SzlKL2FKT0VORXRSUEhRS0ZNb29tTFV0SXlLOWNDOTdMRjdtL2VIWFVSRncv?=
 =?utf-8?B?WkF5Ny9hTVYweHU4MWErV3Z5eWsyT0tGNG5OMWoxMGdERjhGYUptMWNpYnU0?=
 =?utf-8?B?ZnhkZEtYV0ZSZTF5U0FHOFBCa2djMHFFUFJyVnl0TWExcENMYlpGdXZLR1Za?=
 =?utf-8?B?WnM0VHNPNGdIM1JCMEJJS3I3R3FvbWNOYmVWd2NQakJOT1JEMkFEVlpyYm5w?=
 =?utf-8?B?VXBnKzF2Y0h3VGJqL3FoRmIzQUFqYkltUHdqbnkyZ2s0STB1WWovVTJPWS93?=
 =?utf-8?B?MGdETWFRSW9zNkROVHdBaFdFdFVLaGtiVHpnNUo2anp0OE9NSHBuVjVPWW9B?=
 =?utf-8?B?V3dYeFZ3V0FYOVgrUTMyL0cwYzFUeC9XSDlMd1JXLzJzZUlNSkE0NHJpeE4v?=
 =?utf-8?B?STl1cDMxTEhkdXltbVh6U2grem9RPT0=?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f9c85d-dd6e-40dd-e44b-08de2dadcba6
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:09:20.3880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TuQDWk7VK4iXzjrrG7YaDSJRpiBu6gud/fa9gtXkP6pi1x9WTZKvquOo5ZYpnZFiIgGVpfchSxSwD7niCku78Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11196

What
----

Some DSA tags have just the port number in the TX header format, others
have a bit field where in theory, multiple bits can be set, even though
DSA only sets one.

The latter kind is now making use of a dsa_xmit_port_mask() helper,
which will decide when to set more than 1 bit in that mask.

Why
---

David Yang has pointed out in a recently posted patch that HSR packet
duplication on transmission can be offloaded even on HSR-unaware
switches. This should be made generally available to all DSA switches.

How to test
-----------

These patches just lay the groundwork, and there should be no functional
change - so for this set, regression testing is all that's necessary.

For testing the HSR packet duplication idea, I've put together a branch:
https://github.com/vladimiroltean/linux/commits/dsa-simple-hsr-offload/
where most drivers are patched to call dsa_port_simple_hsr_join() and
dsa_port_simple_hsr_leave().

Assuming there are volunteers to also test the latter, one can enable
CONFIG_HSR and create a HSR device using:
$ ip link add name hsr0 type hsr slave1 swp0 slave2 swp1 supervision 45 version 1

This needs to be connected using 2 cables to another system where the
same command was run. Then, one should be able to ping the other board
through the hsr0 interface.

Without the Github branch, a ping over HSR should increase the DSA
conduit interface's TX counters by 2 packets. With the Github branch,
the TX counters should increase by only 1 packet.

Why so many patches
-------------------

To avoid the situation where a patch has to be backported, conflicts
with the work done here, pulls this in as a dependency, and that pulls
in 13 other unrelated drivers. These don't have any dependencies between
each other and can be cherry-picked at will (except they all depend on
patch 1/15).

When will you post the rest of the patches from the Github branch
-----------------------------------------------------------------

Tomorrow. This will leave some time for some early feedback while still
having a chance to catch v6.19.

Thanks for reading!

Cc: "Alvin Šipraga" <alsi@bang-olufsen.dk>
Cc: Chester A. Unal" <chester.a.unal@arinc9.com>
Cc: "Clément Léger" <clement.leger@bootlin.com>
Cc: Daniel Golle <daniel@makrotopia.org>
Cc: David Yang <mmyangfl@gmail.com>
Cc: DENG Qingfang <dqfext@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: George McCollister <george.mccollister@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: Sean Wang <sean.wang@mediatek.com>
Cc: UNGLinuxDriver@microchip.com
Cc: Woojung Huh <woojung.huh@microchip.com>

Vladimir Oltean (15):
  net: dsa: introduce the dsa_xmit_port_mask() tagging protocol helper
  net: dsa: tag_brcm: use the dsa_xmit_port_mask() helper
  net: dsa: tag_gswip: use the dsa_xmit_port_mask() helper
  net: dsa: tag_hellcreek: use the dsa_xmit_port_mask() helper
  net: dsa: tag_ksz: use the dsa_xmit_port_mask() helper
  net: dsa: tag_mtk: use the dsa_xmit_port_mask() helper
  net: dsa: tag_mxl_gsw1xx: use the dsa_xmit_port_mask() helper
  net: dsa: tag_ocelot: use the dsa_xmit_port_mask() helper
  net: dsa: tag_qca: use the dsa_xmit_port_mask() helper
  net: dsa: tag_rtl4_a: use the dsa_xmit_port_mask() helper
  net: dsa: tag_rtl8_4: use the dsa_xmit_port_mask() helper
  net: dsa: tag_rzn1_a5psw: use the dsa_xmit_port_mask() helper
  net: dsa: tag_trailer: use the dsa_xmit_port_mask() helper
  net: dsa: tag_xrs700x: use the dsa_xmit_port_mask() helper
  net: dsa: tag_yt921x: use the dsa_xmit_port_mask() helper

 net/dsa/tag.h            | 18 ++++++++++++++++++
 net/dsa/tag_brcm.c       |  8 ++++----
 net/dsa/tag_gswip.c      |  6 ++----
 net/dsa/tag_hellcreek.c  |  3 +--
 net/dsa/tag_ksz.c        | 20 ++++----------------
 net/dsa/tag_mtk.c        |  3 ++-
 net/dsa/tag_mxl-gsw1xx.c |  7 ++++---
 net/dsa/tag_ocelot.c     |  6 ++----
 net/dsa/tag_qca.c        |  3 +--
 net/dsa/tag_rtl4_a.c     |  2 +-
 net/dsa/tag_rtl8_4.c     |  3 +--
 net/dsa/tag_rzn1_a5psw.c |  3 +--
 net/dsa/tag_trailer.c    |  3 +--
 net/dsa/tag_xrs700x.c    |  8 +-------
 net/dsa/tag_yt921x.c     |  8 +++-----
 15 files changed, 46 insertions(+), 55 deletions(-)

-- 
2.43.0


