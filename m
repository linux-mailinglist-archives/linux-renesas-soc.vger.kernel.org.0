Return-Path: <linux-renesas-soc+bounces-25264-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DDDC8E311
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 13:09:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A13B63AE4F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Nov 2025 12:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA79E32ABEF;
	Thu, 27 Nov 2025 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OZpb9oQD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011057.outbound.protection.outlook.com [40.107.130.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A8832C312;
	Thu, 27 Nov 2025 12:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764245369; cv=fail; b=KdFTqjZtJ9meStMKJOmeXiaom4PlBjE1Y2f4U43Bz5R3ywE1qWXhPGy6528dsqjcJ9qN4yBPXSMe13Iw7+hXwZ4J48tU3WUkmNIILzzisKvKJjXo4yfi2XlpIMaacnSFl6z+cyobvt6SyWq9ViRAHBCndjUZ0uLSawnwETMRagI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764245369; c=relaxed/simple;
	bh=+pzjWLGLWtAKL1qlN38CMWoHCeXo+l7LE0FYGaQttV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FAbDtjRSr3563jgCRFz6fmP+8miP5TbP5C4cDYMYcz2/c3LBN7395ZgGXIuqoE+46m9axq8B6vkoISo1eZ7Hs4gj4og45+a3bnb1g9i2NZtYSRMkNBQZrdaFAtaiOBc5PbFvKVNik1qFOsWqWxpBOk5GRsKYAiUP9C8T7VthpkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OZpb9oQD; arc=fail smtp.client-ip=40.107.130.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vxfmVKjIrhinZOr0NzG/bCMFifnB+UEEyLyMLX/sXrKqsGuDmKUYGmEPxf/SARp9A9K+76j/RneGS1Td9CPWmWWksd2RAgnjbmMlDzM4qu/Jk2tlxevPXKej9PRGp6InYpVvyR5Io8bJhM077vPEn4TBVUwaZ68EiTnsJDsFBoIpXGtXDGoZAuUGyCnhE9Dxip7Q38TFRfFSS8y0HnxYPztCXj6Qzr8kIDiXzOBKmBU6wErleQVVF8O+HcG44Vt8LOkj2vQ69Uza0jh0QVxLQTv/xT3h+Tg8s5eEWqj9XRkRyYmJw4ZG7LcCNbH0EzirCETxPsio+WDRGzpivH6gOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyFKkB0MZAz24FqNREr/BDZyuqBEtLyoU8XtwzzO5D4=;
 b=demdVhBBgLubA2BkrOiFTTox+GrizGDlRiulit7T0S+Pd2OmVYyawRlRzx3n01cmQBMk9PAdwCKnhc7D+bXRkXr1EJ0f/GqPrHgI+jLEvhsrOwyvx3ghvbSdCVl5koKqFwu5DOJcOKhmOqbOyW/KAbZtVsCgUhq8t0mXePFmqJB4blfXwsRSXvP5cLEIowKin0OobMiqxZnPsxOaC108UOu+379w3v05ZD07tGcDRveZHlPqy6ImPtjhK+EPZF2iKm+B3+iOW/blwAyvH2hYlHW/nD1h9THjR6emjnBUeQG/yLYuG1pfFWyxNfOgZPn7FVldqMM7erJfh4gAZ1vFnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyFKkB0MZAz24FqNREr/BDZyuqBEtLyoU8XtwzzO5D4=;
 b=OZpb9oQDB2t6g09TQxdVaehRDyDfmPEP0vQW4aGDMIpygZS4NYEJOIoY6S2VkvTJvEzzHdOOS3gLTS7bUYm1zn3XKlmGQf+p/Yx3+qaGnnwOgCo06MBhkc5FRPkP9+2SMFUPM8QgeZ41WAtdYmcei1O4+I74cXn1F17pRres6hjsNUJbH+pvHr+kLEWs/QNPeybUHL+IG3uOE7xm842z2Zdg1huNbzToyxYMK37DRna7L8J4GMzrEQP0IyAlCYL8R1BzI2qTplWFRB65MLTUHngKsaESVOVJQFnfzZ1FMCqR15Lfik245qVK2aglIuFGqFuISHFGuKDdSqApFsuvMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com (2603:10a6:20b:438::13)
 by VI2PR04MB11196.eurprd04.prod.outlook.com (2603:10a6:800:291::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Thu, 27 Nov
 2025 12:09:21 +0000
Received: from AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab]) by AM9PR04MB8585.eurprd04.prod.outlook.com
 ([fe80::8063:666f:9a2e:1dab%5]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 12:09:21 +0000
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
Subject: [PATCH net-next 01/15] net: dsa: introduce the dsa_xmit_port_mask() tagging protocol helper
Date: Thu, 27 Nov 2025 14:08:48 +0200
Message-ID: <20251127120902.292555-2-vladimir.oltean@nxp.com>
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
X-MS-TrafficTypeDiagnostic: AM9PR04MB8585:EE_|VI2PR04MB11196:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a4edf4d-7078-49df-9072-08de2dadcc7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|376014|7416014|52116014|1800799024|19092799006;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0ZmVVhkQ25LRmlXMmpZMStrVFJTRGNnZjdtaW5qc1JNcGlzRnVRN0VoaldP?=
 =?utf-8?B?aTNYVEZpUWFLb0c4SDJXNnoySFJzaW1LM2dmM1pCLzM4REVkUVMzR1VEYTgz?=
 =?utf-8?B?d0oxR3h3UDdyNHp3eG5LMjBEZ0dvbHhSUThaUTNwM2pLcmx2VHZQTEt4S0xK?=
 =?utf-8?B?dWcxNVZEVlF3bDdVYUNhZFhUUGRteFFKNUpOZzhEYXg4RENRZ1lRYmltOG1Z?=
 =?utf-8?B?N2V3c08xSW1lbXdMdTBwOVFTc1Q3SE84ZllHZ0FkdzhuMWJmSnZrYWo0cEhy?=
 =?utf-8?B?S1Y5OG5ZZU1ZbmJ6cjZUZmZaVnVrS0lhSjJXMjJ0ZGc4TXpKWWVpSThjSU12?=
 =?utf-8?B?c1JiT090NlVqN1BBdEM5VURFNTZZakdyUFNzejFmVEVmWWlYMHhOSEF3a20x?=
 =?utf-8?B?S09id0hha1BHTGsreGxMWkJ0SVlGNUR2Q29QSG1SZ0RGWTE3MDJxd3VJZkJp?=
 =?utf-8?B?dkUra3NCNHJWamVUN0JCeVhLU2NTNHZZVmRMRzVvN1pGTGg0MDJIK3JTNXpK?=
 =?utf-8?B?M242Y0p2Rk9yaXBYMHdRZVZPVktFRExkWElvUkNDWEp2U0h2RWxPN1p5NjFz?=
 =?utf-8?B?eGZCSGoxcXBrMm93dWpnQ21qK0hDRE1sTzRBNEdUTkxwK0hVNkJMWUlFLzJl?=
 =?utf-8?B?MG03cmF0d0tKRmhQRkFnY09ELytHRFA2dGRrUkprRXFENDJZVjJSNjVkTUUw?=
 =?utf-8?B?SGdDTVMrWjAwM3NDYUpMbW5lbTNpOFhraXFQWjNpNmZ5bHJLWHlVaDhKTXhW?=
 =?utf-8?B?WC9EbzJBZWtqQnlReE9EUnRYNjZaYU4ycVN3MXBtU1UzMkdBRDFJK1NSQm9C?=
 =?utf-8?B?di9pT3RwYmhHanhnUk14U0VlbVhEVVdBWUVkckg1ZFhKbE52R3pEem1wNEF6?=
 =?utf-8?B?OG5paUdrR3ZKZlIxUEtYYzNlR0JOSEVkaTNnVWh3MHhSK1laMGh3S3Z6dHUv?=
 =?utf-8?B?a2E3M2pnTnR0ZW9ra2p3Qkt4NlBUcEJ1UlcwRlc5dFgwcjBkanNQcXFKTE9h?=
 =?utf-8?B?NUJGd3JXMGd0RzJoOWg1K2VDSHBJclpVRG1mMUVKRys3SWVBZnVkQk9DdDJu?=
 =?utf-8?B?TGY0OU42Z1pQQ1VSUG9sNzhYeEtjd1hyRUJkNTk4NnI2R3dNS0JlTmVlc2pn?=
 =?utf-8?B?VDdNZTZiTGxaaTdQWnN1eVVVRW0yMkl1TlN4QTVjS3NQZW8vZVpZbHFFckxT?=
 =?utf-8?B?YWdTOHo4Q25Za21qQ0JsOW9ncU9rM0ZidUFXOWh5bHJRbndFZGpUTENSUFEw?=
 =?utf-8?B?cWhaYW1XRkN2K0RXNnZXdDhpdlk1L0Q5SHpBSjN4Z01NcXM5S3crVUVVVmsx?=
 =?utf-8?B?ZlFaWDNMWDRIQk9IUDVaNDEvb0U0SVJjYnY4dWpvdExlc1BQWHRacU5vZ2RH?=
 =?utf-8?B?ajNZbU0xMngyQ3hFTUFLZFFXVXk0NSsyalZFSDFhVVI0dWhKZHFQdW9PRGsv?=
 =?utf-8?B?SmZkWklnT2JmVGFPcEttU3pYcG9sUkN6Q2E1cVBZVWEvUGhZaTdPSlRUT2FQ?=
 =?utf-8?B?cXBxK2VXQnF5dlVuRUNxVHBRb0lMTWhxODR3THc5VVJrZUx2VXE5QWtRMDBh?=
 =?utf-8?B?Y1YzNmROdDBNTUM4aVl0RzR4NFV4S2toRHlXbkJXSmtRTUh2aUUyckh3MkFS?=
 =?utf-8?B?d1VGWnFzb292ME90dEFHTVY1WFVmZ1hqYmN6dXFERDNvc1poV1VpTVhRZ25v?=
 =?utf-8?B?Qlc0amE3YWRubXlhZm8rMDFoUFEvbk5QNzlnTFRqMW5xaGI3b3VrdnRsWjZt?=
 =?utf-8?B?cjFhOEh3bGV1UGNhdG5jQTM0azd3NElPRVhhOFZTaStqd0RBeVo0clVERHBR?=
 =?utf-8?B?aDllVmhKbVFoSXFDcjQ1VzIvL2h3V1ZBSmxtdWpXUFBhREtiblpEcGhVdzl3?=
 =?utf-8?B?OThiUWZ6ZkpZUGZnT2RnckhNUXhUeS93WVNMRFEvdndTRENvMjV5ZGpzRGY4?=
 =?utf-8?B?VmhISis5TVBmY28wS2QvOG4zRkZzTGhEY0J3YmdjK05HUEpKWEhnSWZONHpW?=
 =?utf-8?B?R3ZEbjdKV21BPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8585.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(376014)(7416014)(52116014)(1800799024)(19092799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VWZVQVhGcjdtaklFSG9Pam96dWZlcGlpdkpFK1lLK0pia0FVdHVpcTJRMzIx?=
 =?utf-8?B?TnlHUmdFeS9xVXNOLzdWczNoUlg1Y05KREIvWU5sSEFDcStxSHlCd21jSjkz?=
 =?utf-8?B?WllqeGdWclp4dUVxMUlSNXlQSmlOdDhGYm1RdC9pRm9VSk02TmlEOVVmYWJ0?=
 =?utf-8?B?UDZQRDZNVFhxbWwzckwzSjhjdkp5ZjFpczFBL0E3bmtNQnh2UnBLY2l3Z2E5?=
 =?utf-8?B?NElUblV5Skc3MmNBZ1lwVmRtUHhBdEc4NS9OY3NZOG84TmRLVnRyTHh5VzR0?=
 =?utf-8?B?NWZRVkpGRW1xcERscmhmRmVQbnVlWUpKTVZmY3J4cGtoTUVUdzVMZjUvbWFP?=
 =?utf-8?B?N2NoSE9hSm55R1lRd0dnS1FlZjJBUjA0dG9ybmRhbU9nSGcvU3lUNWUxck5H?=
 =?utf-8?B?VUM5ZmxKOGd5ME9FQjNyaWJXY0Vuc1RvcVB4WkN0YUdtUFp4czZEV2tkMS9P?=
 =?utf-8?B?SGZpRllkQWtrY3NKMFhBS2puRUtRQ1I0K1RiNjRSbEo2SlJsZ2dlcnRZWlh5?=
 =?utf-8?B?Z3V6L1Z6RmNlU3QrMlp4V2NCamlSZHpHZ0FHUXVVOGdtYzZ2UVI0SWJTbU54?=
 =?utf-8?B?SmVtZDdHajREZTY4SHA0b2hnczdMbkJVU05HYVpoQi9lT0lrL3JjdHVROVBV?=
 =?utf-8?B?VUU3VTliQVY5QXhqaG51bEtBWngxbGl1K09VZGlmeVI0NzBmcGhGU0VOWk9a?=
 =?utf-8?B?MmFYUTVCQlhpRFhyTkZlUDlUNnh1MlJOUXN6c3l2Q2lNbkhmU25pekpEOGhR?=
 =?utf-8?B?ZTlZYVFSb1lxcGV1L3NLaDFBR2I0M0FTYWdTQXdtZlZFeTkrWDhsUkhXanQx?=
 =?utf-8?B?azZod0lPOGRBUWp0aEpDcHVvaVNlcFF0RVFUN0tFNS85ay90NW9hTXVrZ1Zm?=
 =?utf-8?B?L0E2TXI2VFpGOUx3cFhBNXJmZVQ1ajRKaFRwcXloYTRObGJQaStPaXYxK2ln?=
 =?utf-8?B?RGNTY3VVK2RrRzlNZFhUUkQ1ditQWXN6QmI1c1l4WnJlZXl1Y3NpaE84RnI2?=
 =?utf-8?B?MlIyRU43bWtCdXJFU3R3c2hqTHNMK0VHMEduK3hlL1pUUTB4Qm9mM2ZqNGxy?=
 =?utf-8?B?VXp1ZmEzYWhHSFRXRCtsalBSL0lsUVR5MjNDRElkYzZuYWRPdUMrMmo4NlQ4?=
 =?utf-8?B?UGNOZ0JMZnYrVkhoRVhLNzZDVjFwMmVNdGdpSU9OSlFVdjZRbHpuUVlFK2VQ?=
 =?utf-8?B?V2lERFJPMk9BRTJEeEFVbURZZm01NnVVNlJZckgzTVZITnd2eXp0d1RacnZ6?=
 =?utf-8?B?bXU3WkI0ajNyUVVXSGtleDJ5RThHOXFHVGFJc2ZmSE4waXBhS0QzNXdUcCsv?=
 =?utf-8?B?b2pEZHNtdHVvcXkrYkpPcjRNYm55T09walk0M0JabUpyUGhOdHUwWHJHYnZx?=
 =?utf-8?B?UW1qci8vMnZyT1d0ZllEcVYyMTRva3I1UnpwUnB1dFdCVGYvME56MUs4cGRP?=
 =?utf-8?B?Zm1lWGE3VmttRktsVE9KcWFYd2hvalJNdy8yZjRTZlZ5UXFXVFV3Qm5OYWFF?=
 =?utf-8?B?eTJFYXJab3pxeDVKbitVLzA5bWMxaTRGSEk3QjVaaUg0QnUyOWdKSldIWmV3?=
 =?utf-8?B?cm9QNXZoT2d0T1V0bjlkSlluUUNzb1NyNk9oKzFucVh5NTEzQVhuRjRIZjZt?=
 =?utf-8?B?bE9mS1hLSmZyblh3LzNKeHZHbmYwZGVuT05BUFFBZS9rVmZoeDU2Vk9ETDQ4?=
 =?utf-8?B?Y29JNWdqa0ljWkZ1ZmFDV3VOdmdRaDhzTitkT1hkT0ZSSG5lMzdySmJFV1Nv?=
 =?utf-8?B?OUR6V09SWFl4R1hoTzZkN2ZuV3VxeFlTa3p4dElYUkt1aHM2eWVKbW95WlAy?=
 =?utf-8?B?VTkyVld0ak9ycWk5ZEZvcUxUSGprMEJLUVpEQ1BHKzFzRXdaMTQ0L2lha00z?=
 =?utf-8?B?NHl3cXV5Rmk3RXJobmgxVm4yc0Y4N2s0dVZIUlpWL2swemNjbE1NT0RDdDl5?=
 =?utf-8?B?MXBuTHUvOWV6MzVldDJtVllpWWNETVNsaURDZ3BqOVVNajZ6cEhTTzgwVnR6?=
 =?utf-8?B?L3dkTEhoQ2ZMNFpzZFFMd1BDSjBKbUhYc2tFeTliNDE4QzQ4bDhhMWczS1V4?=
 =?utf-8?B?ODM3WmI1MVFZYnFDTVhPUG9KeEw0Z3VKcEdsMHVxNklFeWcxeWx3RlR1MG5h?=
 =?utf-8?B?eS91K1oybVcwZmpyMzhMcXJIN3JtOUV3ZUwwWWJZcWpGRGcrM01IMXU2K0l0?=
 =?utf-8?B?MEVSaDFENUFVbWRXMThEdlRxa1NUbXBhR0hkQUU0R2htZG5pem5Vbld2YjNQ?=
 =?utf-8?B?eE03alFHZ3p0Ty9ndkw2UmZKZnVRPT0=?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a4edf4d-7078-49df-9072-08de2dadcc7c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8585.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 12:09:21.7843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjbyR3YAStytaVP7tHxrBBkU9vf5BKu2MO5ZzaMA14m8L1RRbiGUFwxvRHVPffjygnpMXvCUl/xpOmFLBx4ZCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11196

Many tagging protocols deal with the transmit port mask being a bit
mask, and set it to BIT(dp->index). Not a big deal.

Also, some tagging protocols are written for switches which support HSR
offload (including packet duplication offload), there we see a walk
using dsa_hsr_foreach_port() to find the other port in the same switch
that's member of the HSR, and set that bit in the port mask too.

That isn't sufficiently interesting either, until you come to realize
that there isn't anything special in the second case that switches just
in the first one can't do too.

It just becomes a matter of "is it wise to do it? are sufficient people
using HSR/PRP with generic off-the-shelf switches to justify add an
extra test in the data path?" - the answer to which is probably "it
depends". It isn't _much_ worse to not have HSR offload at all, so as to
make it impractical, esp. with a rich OS like Linux. But the HSR users
are rather specialized in industrial networking.

Anyway, the change acts on the premise that we're going to have support
for this, it should be uniformly implemented for everyone, and that if
we find some sort of balance, we can keep everyone relatively happy.

So I've disabled that logic if CONFIG_HSR isn't enabled, and I've tilted
the branch predictor to say it's unlikely we're transmitting through a
port with this capability currently active. On branch miss, we're still
going to save the transmission of one packet, so there's some remaining
benefit there too. I don't _think_ we need to jump to static keys yet.

The helper returns a 32-bit zero-based unsigned number, that callers
have to transpose using FIELD_PREP(). It is not the first time we assume
DSA switches won't be larger than 32 ports - dsa_user_ports() has that
assumption baked into it too.

One last development note about why pass the "skb" argument when this
isn't used. Looking at the compiled code on arm64, which is identical
both with and without it, the answer is "why not?" - who knows what
other features dependent on the skb may be handled in the future.

Link: https://lore.kernel.org/netdev/20251126093240.2853294-4-mmyangfl@gmail.com/
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
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 net/dsa/tag.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/net/dsa/tag.h b/net/dsa/tag.h
index 5d80ddad4ff6..cf52283fe9df 100644
--- a/net/dsa/tag.h
+++ b/net/dsa/tag.h
@@ -319,6 +319,24 @@ static inline void *dsa_etype_header_pos_tx(struct sk_buff *skb)
 	return skb->data + 2 * ETH_ALEN;
 }
 
+static inline unsigned long dsa_xmit_port_mask(const struct sk_buff *skb,
+					       const struct net_device *dev)
+{
+	struct dsa_port *dp = dsa_user_to_port(dev);
+	unsigned long mask = BIT(dp->index);
+
+	if (IS_ENABLED(CONFIG_HSR) &&
+	    unlikely(dev->features & NETIF_F_HW_HSR_DUP)) {
+		struct net_device *hsr_dev = dp->hsr_dev;
+		struct dsa_port *other_dp;
+
+		dsa_hsr_foreach_port(other_dp, dp->ds, hsr_dev)
+			mask |= BIT(other_dp->index);
+	}
+
+	return mask;
+}
+
 /* Create 2 modaliases per tagging protocol, one to auto-load the module
  * given the ID reported by get_tag_protocol(), and the other by name.
  */
-- 
2.43.0


