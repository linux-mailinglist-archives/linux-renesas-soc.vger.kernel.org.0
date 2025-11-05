Return-Path: <linux-renesas-soc+bounces-24163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5118BC36879
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 16:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8BCB1A42BB1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 15:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2BD335071;
	Wed,  5 Nov 2025 15:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JXMKv25o"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9B7334C18;
	Wed,  5 Nov 2025 15:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762357277; cv=fail; b=fBgzZrVUmGNF39Gf6jKX7l9XPX2bi/3NEOrSFbJG1m8Q1i5Ihy3UxihkKo2xwrrgUP4qBFYcllia2oEC7Z+Bps0DA7dru1oJNbJoRibuaWrBlnGdyOYqx/Ay4zG8g4Ug8M4VGtoLVA7h4Si1uaYShGQZyoGN4QvZYxPceNqPYGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762357277; c=relaxed/simple;
	bh=24BfPNNTAEapYd4+Y7CBJEqsZev73kr578kA3Sa+Yiw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDZrI0dvAtpFy00V9PnGgI2rzszVNpuPxJy7U0LoWjKmyMOcKQSEjuLxJX4k7t62R+0kcaDZUTSpDLRfd96TTS2yVUJU0nXGZn5JmwmB/TKldXkPimGqE7SL1qbGqZJPgPW7001JFbrH/XXIXz5F/VMiwDnaSH/5/fsCUGRFpgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JXMKv25o; arc=fail smtp.client-ip=52.101.125.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+zCbIlTM+zoMLQ739H74uwjkt9e0hGR7f7gIaeOz64amvKWNcWbUvHq5ZCY+d+BVVT5l49BZAjvOg9gJUV81n5aPm3HxgG4uZRB9w3TTCuVYYPKjkcX92HqvZhzW2bgE0sFYfYhwbpK1Vbi3bQZ8fsOdrPNXe3ao16cUUa2lEMx28wZa+i2v4mPTLJI/6Ckmm2a+plxGdnKipN4FwYcJsPERT63FDo7HudoUEKqBrm+9SzFgvUzKIEAX56NGXYK8en7OM7H05D7gwuydH0hiLeYqFADZK+ytJmzEMTMBy9NfslR7Pf2EJ/osSrJiUZE6MjaVVtBy6J/iFDG0eHD+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i9BqOx0psr7t7ipYbXLvF7o74+p82d8jXLR0tuCO9qQ=;
 b=VucG3cr28sxrCitxPRjledqLH0G+GBmSG2PmaPVnA6+J+s4aPSSj6luhFOU8D23Z9Q2HGIynFXudngxiSri3CWj+eKXGfVEqE8EtoKV4O1Yj/CsLHlDeAfqpKB7Ic3BsNTrCyAh5x40PTGQPYYee/l2V9CBz5HetICPpt13h6rNAc7vVUENZQNhNqzmGd1+fAYaVA91L7tx/PR1vdsCJofcv/qWeoLYbVdxq3ZQ9Iw1h76ySJha2f14MqzQoX9+nqgTYnYqg0mzXrMETsXec9gtZuDy0KntbasZr25G82VkpoFgXFU/Z7l0jFNYMYc4/cog47b5fG245/bmp0yfqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i9BqOx0psr7t7ipYbXLvF7o74+p82d8jXLR0tuCO9qQ=;
 b=JXMKv25oxgT6HKUt2SbaWsxgdzouQR2Ju4dnOVC2icIHUfE5L4uuHCs3wXvk4KJuFb/NxzgYn0IXEFhFR8+MKOc1oXewPQostBRuHcfWV02cVflAAAzJBkfwmaq0b4Po34u3maU+N2q3+4VzIvMibnz/RPKoS6oq5c3hRmrtMWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB11268.jpnprd01.prod.outlook.com (2603:1096:400:3bd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.10; Wed, 5 Nov
 2025 15:41:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9298.010; Wed, 5 Nov 2025
 15:41:13 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Rosin <peda@axentia.se>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/21] phy: renesas: rcar-gen3-usb2: Use mux-state for phyrst management
Date: Wed,  5 Nov 2025 16:39:06 +0100
Message-ID: <e850d3459024ee8616ec8d407d7672221beef90b.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1762354366.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FRYP281CA0002.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::12)
 To TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB11268:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a9a540-c883-46ee-97a1-08de1c81bfee
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ebHTrfBswm1jm7RgnreUOGYy1dXpATaiEHaxuBv38WfcTPFgAz/8OfLUpBhO?=
 =?us-ascii?Q?7qo9lFf7zh5PwSyKZ+m+2wZk63BJ+fcXNPi/yqmn0ndLPlT7vztgzJBV7QML?=
 =?us-ascii?Q?wHXavvws9Qi9LJRomNAxj7aqv7vsyKbJLuSljf1c1sCzo1LYv+7Ta2DSO8yW?=
 =?us-ascii?Q?0Td8MWSvVYp11zfZr60kNJ2iIOpbaxj/wSzgAghR4egTkoQkhFj1r6QlZcAy?=
 =?us-ascii?Q?xorjAM4tyKVSIeOUJ1JCHh9X0OCeAOSOQzREnPzcECMVXeTegU0RH4r7aVup?=
 =?us-ascii?Q?BA7/cUOGoTfsHGmgWVa78dphIdG/MEbfFAnn+jNMVMpSFGuPhQEJ5DpQt5LS?=
 =?us-ascii?Q?DrOZSi6hGJIM0q9Jam+TK7TJJt19QQPG+IkBnx9ldeslLaChEgSZEinkZJPI?=
 =?us-ascii?Q?1r3iKmIlvwYn9wj5v0aTqHiFm3YX4/FITIkVCJScsM+JRnkW9Aiz+2ro9FVq?=
 =?us-ascii?Q?w+7bKu/z7lRN83CHDbPWuvc3MvLo7hosz5eSh1ilXSG4Mlsczm1b/u/7E9OD?=
 =?us-ascii?Q?XSh0df+Fj66NnoFiz97t41CxkwORvB0f79nXshaKHpliO/g3AIRVdxguOqEr?=
 =?us-ascii?Q?2c1WBHC82JKwXOFqEgpN70WSJqmZESmfJzzx7IIIGuYD35P4fVEkVc3M+Wf4?=
 =?us-ascii?Q?2iJDfWiZopE7S4zpXjXKiNQ+n9KqsBxF1dd2XbAc/3zpgesTZ/NJBqSJdn4x?=
 =?us-ascii?Q?hYcblg77Jxga7VDze+I+zYzQprJJBDix6HeeVwWWBwBMEPInMpA+c57cKdze?=
 =?us-ascii?Q?iLv8rtqU4bt90syaEOcR3ibf5rhTcwAiyJTQfj4X+6JqkS/2zqOGsTn42nY8?=
 =?us-ascii?Q?rb/6xTjirlVcqisWrkbMGarIxnrPQuDg+Gkt/smQWxeDtkO4402nJHAxetAE?=
 =?us-ascii?Q?s5Zp8QD/inF3zX/MQluPUIjGuaeh1tHZasY4dTDntMYaer1aVGuT+os3TU+p?=
 =?us-ascii?Q?XW4b5K+OZ+uaYziq0l3ysMvDV0vFYIDDsiMIyyx6Sy3OamnhArgGiNyySIKe?=
 =?us-ascii?Q?V0AEYkj/xQbW3wOQVQQCvhbdsNyL+m+m+H60CDbAkkZyx5q1/rdYok0UABDX?=
 =?us-ascii?Q?6qu3YOppufDgRBPGLYSqqZe+A5DvR+C2W4ExPN93sglAPzou8K4p2jPEl1/Q?=
 =?us-ascii?Q?kPNI/dJONToHPgPDItyOzJAudk4/0/hUlDRC95Zz9GH8y+w1hoewbftW0zDA?=
 =?us-ascii?Q?cChRCUfBTmQtkg+HrOZE2T56N7Pu6H96wtfEq6YQjtFkUaIetRs88RkWNy5r?=
 =?us-ascii?Q?dnzp91E1orhDTWkQh1v1he5KCbqWwYfsWj/FbhRaXci+JPMcXLGyjanf4KIw?=
 =?us-ascii?Q?+aPP1ll3/c3/OI0I2mrqBdwj4RFj0EqC1Heeqo7wlzZEiQeZ6ZsoAgSLJFR8?=
 =?us-ascii?Q?UhbXjwJ7k4pGl/pKiEgAFoeFw/uOQZEPotz/VH6QaKoT5X8fQuJsUNd4hC7k?=
 =?us-ascii?Q?1aE4gxDdRNuGL00xnCUZBYDRTGTVcC+3KZYg1NZ/P1Sg2olPKAEtH5YB2JfY?=
 =?us-ascii?Q?k5eBzbj8QCKJTi1zy8TxtfT9tF8+b3WHgbdJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rQdAH47F4trYX/eCl7rheLN+eQJ7Vby7HW6Xak0YBEv8u7DtyVhKOzVxEVRD?=
 =?us-ascii?Q?xpgcuEGQ3HVCDHvYqkuJPryzj2LGMQ/lA6o3sLcfcAx0RgIHhvENIMP+u03B?=
 =?us-ascii?Q?BUU9y1VBqr1pOSnE8JEvq/lMV6UTE9IaV4Rybzg+SCnLShoFQqC49fSn7OJg?=
 =?us-ascii?Q?DKOx2XZQ5Ze1frhzFxMi/HJN0d9U1oixNa+Ri/Wcq22cYa6eqaMiSxII3Qvt?=
 =?us-ascii?Q?PGjKgh/XPaIpg6rGuSw2Hbnbxyjq4Nes/6o+OVAVgrJ6DBt7znVYzektX208?=
 =?us-ascii?Q?IPHRbKaEtjQ73BBRO58FUqNbYY/2EwXjoFE1ZarzbZ3nSuIKQgz0gGxVbIue?=
 =?us-ascii?Q?fYHNuGiZ2+QLO8sIaw8OXd4qA+PszK6pecoJgSpcX3WL4oIyOHvOTlhB4FAV?=
 =?us-ascii?Q?kVIabi0fbmX5d5kpNo0l9M/hZJLtdYRKsKdmdepky7ZSWDWSSEExWd/bVAuD?=
 =?us-ascii?Q?c02dP79B1jYA1GTdgP+vTQsd5C32f0pV8XN2OBq5xcQVKoSlouSuwKTBH340?=
 =?us-ascii?Q?RQvhryZCtnio+0FMdPLKVzvPl83gc1FTksIgMe5wE21mKWH2Uam2fUc6hkyr?=
 =?us-ascii?Q?FSeWrbuvuYp4pDJCGApu6wxFLozckSWHsXL0n1PE6rzql2Yw/Nou5bizhWA1?=
 =?us-ascii?Q?E1iwxVG7fq17quC3saIV7YOl53YFWoh4l+Kuu8Bfa+az5Md1baNSExtggA2z?=
 =?us-ascii?Q?IZl2sredmIybz5OiT1gKBtkJHuIl5ykCaTPKS30dRBniK1nNoHf+WsLr8sPl?=
 =?us-ascii?Q?gk/b2Y6tuz5mxZijmbo2KZT5JylPQgF4qSEyMqlngezyUsfSmY1IGLwjaETr?=
 =?us-ascii?Q?TrW8gDw/In6zPnYth/EFihT52pt1oJA1DXyY/SYRFFqVh0w0yjjFsIUlHtid?=
 =?us-ascii?Q?0ddUvrpZfjls1TB5Siknf2mNTThyOq2EmniVBCm0apF4W1qEcguDGzs7Wmdr?=
 =?us-ascii?Q?pxvzshSnJprazLTBfwI+g5+Djde5mD19TxX6CwKlB2FMrNNZajDXfxgv+v0v?=
 =?us-ascii?Q?VpfiaBZT7YaiuC6A2ZGhrwA5iH5mJZtlmo6zJUgmB9bdiXCbTZRS0ROQwpLh?=
 =?us-ascii?Q?tB8nBx8WhKrZoYtE5N5eINHZESPme+Nj9cC/yj9Vqq/Vwk7mPdVavU50G1ch?=
 =?us-ascii?Q?zuGt/0cuRzrIs8nWzSPZsNtJFLHUTHxx0asg2IkYjeCn4EQLAsrKeUE762JR?=
 =?us-ascii?Q?AtCayTlrs8IbnNlLvvfpRf8Mnv3xN4N7BSjiguusWlH+2LN+9daw6fi7WmHx?=
 =?us-ascii?Q?sCfhn+dqIBaUjd2nFgZrdGn1XSYHnQst8NRqZtYc9Ly0X4GnCAlteLAJ3piY?=
 =?us-ascii?Q?2Z6V7zjXXc+h5Gh4t3tdnFOCyZzVTK9CEP/W7WFjhg9EhlquUr3TGMb2aT8j?=
 =?us-ascii?Q?ZQEMcsiVi1d8TuJ8EL42AA+tyjW3l0gPbT62I78SNSEo694FV6waOUGjGpme?=
 =?us-ascii?Q?8/PhPk2il4QwtOLJV+L+GgCotLptly9Wn1LETPD/S6352G3ovGD4tUeuMNUX?=
 =?us-ascii?Q?2dwGly7uttWCwNa4MBCpfbMK8Zn6W/MTLtWGonniEtL/a3lu1fnYHK/V8mN5?=
 =?us-ascii?Q?DGXoJwnLMKL5Xw/H0aaLEkrWqRuX8w05LsROyFzERYwpPdJpBCXyKOFpw5pZ?=
 =?us-ascii?Q?jRuRSOFxRcf/jgNnK0Prjy4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a9a540-c883-46ee-97a1-08de1c81bfee
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 15:41:13.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 86vPXQpV9ARX5gwZOWeyrrZcMSuP3W+4F2tQuFNljRvqZQCUQYmwrYh2z5hulxKZtiLLcv4xFCqOsrCtdFmHBehjUdwKszIbmINnwDOofdyJgJlt52s3hxUlJNXxbBvJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11268

Add support for selecting the phyrst mux-state using the Linux mux
subsystem in the R-Car Gen3 USB2 PHY driver. This ensures correct hardware
initialization and integration with systems utilizing the mux-state device
tree property.

A temporary wrapper for optional muxes is introduced until native support
is available in the multiplexer subsystem.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - New patch

 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 6424fce18705..50817bffff34 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -17,6 +17,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/mux/consumer.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
@@ -948,11 +949,27 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
 }
 
+/* Temporary wrapper until the multiplexer subsystem supports optional muxes */
+static inline struct mux_state *
+devm_mux_state_get_optional(struct device *dev, const char *mux_name)
+{
+	if (!of_property_present(dev->of_node, "mux-states"))
+		return NULL;
+
+	return devm_mux_state_get(dev, mux_name);
+}
+
+static void rcar_gen3_phy_mux_state_deselect(void *data)
+{
+	mux_state_deselect(data);
+}
+
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct mux_state *mux_state;
 	int ret = 0, i, irq;
 
 	if (!dev->of_node) {
@@ -1019,6 +1036,23 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		phy_set_drvdata(channel->rphys[i].phy, &channel->rphys[i]);
 	}
 
+	mux_state = devm_mux_state_get_optional(dev, NULL);
+	if (IS_ERR(mux_state)) {
+		if (PTR_ERR(mux_state) == -EPROBE_DEFER)
+			return PTR_ERR(mux_state);
+		mux_state = NULL;
+	} else {
+		ret = mux_state_select(mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to select USB mux\n");
+
+		ret = devm_add_action_or_reset(dev, rcar_gen3_phy_mux_state_deselect,
+					       mux_state);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to register USB mux state deselect\n");
+	}
+
 	if (channel->phy_data->no_adp_ctrl && channel->is_otg_channel) {
 		ret = rcar_gen3_phy_usb2_vbus_regulator_register(channel);
 		if (ret)
-- 
2.43.0


