Return-Path: <linux-renesas-soc+bounces-22550-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F79BB1D71
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 23:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59CDA19C5358
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 21:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 367BC3126A8;
	Wed,  1 Oct 2025 21:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="avrVvz1X"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011001.outbound.protection.outlook.com [52.101.125.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39165312828;
	Wed,  1 Oct 2025 21:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759354154; cv=fail; b=Sl67pCnqLCREEm4+nmi1ezRcVyJlHJgs845uAQuJ565j12dFsv8/bYgZIZ97SLzuIXqdQJXxcPXorFHJzcrnwamuE57SNC9JeBISu/iER7uFswrPna/snUonc7He1rMFZFcDuZKHhktvmRK873oyt9JeHEqyNIdXQar64BVRS6A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759354154; c=relaxed/simple;
	bh=SgxGItKNSBrQRvxEcvjo4ASIyLG22LJDTlSUmCK7pRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VjP3bl0513d56L7uVzjcRI+fEFbqlSJCSC+YJPOGnFAfIZRxlB2hWFg2Qo396XBE20YA3n0fWFJmQUaLbYVqxje/LaQDBBgvu8EKTq/z6U6b/ktGnxCK2zeNm1/Ml0L4dVMzv/Me4RlaBR/sS/0EszFgTNstPd359f5wKKstwUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=avrVvz1X; arc=fail smtp.client-ip=52.101.125.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUYyYcT+D5BzFhuP/ndJ3MUA84ueCOinTmyaNTkYEEuWV7mK14JKUqGc0Hnai05gMBNtSzHtHz3PM7fHKnAr4qzsZU7qmpVL01lVhcAPGOzllR3ERtyR3AKCz/+kc3uEKx0+gRBjQtAjwhNbdlyYIb5UZiABId0+xmmLz6xpdYZ2pmkPKaLkvqSHetduboep5wVrmoZ5y5LK5gnShKnpPzs4d+VcpBz7GFNe1NFHNRquzHqFSHwcUnBk0fLVNPOFneRyEguQXUsU9jVcmo67hibPvmqwMk94GISBInH47DnnM4AL65peAY66gnJAWYDJ88dushYAiLvZCvJz9EJdGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXVvvLm70x0GWHVeOxTWBtNMYOZcEhHhl/VCPuoERxo=;
 b=a4bML2g5nqqPtwnbaS2k/DvIEcw8Ubcc1s9YhxwqfuON7h975mtNhOL5yc72fozMR4Fr9Twx447gs6JdP0U8iWhgQ7pgZc7wpbJ+/1J2tL4ntCb5lVjPZrbj4hhkefZxIqEno13etKJo8BDWyiC3J8nZUWXlGy0TSMsL4hf3YJ3ptrR5e4GpiGZ1Qcy3DhD4vYA11Iyslch+u2WRC+sHxYy3bbJCR3prVuWikAAW6PcMLp7Wu2e0iWxqq4jTutCU9hPTv0uRq6As4o/ab2tGTeHKYV+ni2imzHcUtLyl5i4LRjNp/WiUbM9iiZpHXn0CZ2Dhy5ACg6B7K3JIPood1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXVvvLm70x0GWHVeOxTWBtNMYOZcEhHhl/VCPuoERxo=;
 b=avrVvz1X2F+O0cv8MWWROKCRlg1eeLv50JYupH5AbwrSnOSQz2DudFSu8lfLbS7H903sHHcyXRba8005pJkhxHYd6AGhA22eduILaodHWhRRM7ZmvnBxlCYISID6i0JPcyrt47sysbC4vYpm+BPp3jXKVfCKUPcIup+L336z5mA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY4PR01MB13012.jpnprd01.prod.outlook.com (2603:1096:405:1dd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Wed, 1 Oct
 2025 21:29:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::63d8:fff3:8390:8d31%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 21:29:08 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org
Subject: [PATCH 14/18] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2 PHY0 VBUS support
Date: Wed,  1 Oct 2025 23:26:58 +0200
Message-ID: <20251001212709.579080-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
References: <20251001212709.579080-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0134.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY4PR01MB13012:EE_
X-MS-Office365-Filtering-Correlation-Id: 7dae7599-1c92-4f79-df18-08de01318e2d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rXjRnani5SZxR3MrRUPV/bGWV+bhl3T2n3xOd+x5Q0W7lHxDBnlIYKbmkANN?=
 =?us-ascii?Q?e2webkiyelj7K/GOvMcF6oq3HByg+cpcpj+DR8Cn/tqZxQV6PFbMu2lFPEld?=
 =?us-ascii?Q?+3owJNwXh0bfAR4BJ+DtsJLffAEv/OhyMKmQl0AOUoTiICT2kW5eCMjnvHG9?=
 =?us-ascii?Q?BuZN9/F8k1KPwbQgfNh3SCf6RqkQMcTWsrzM2algcy/YtGuzzasZZt/cBGDp?=
 =?us-ascii?Q?huaaTSosgtkfUhucsER/0n0nqPp3duUKB7tJpKh7YEWsmriQRYWfkz73kLIy?=
 =?us-ascii?Q?+J0jx81xH4mBPQZDgllIf1YkSVeugda/kBKulPLPoRJ8OTBXxvcRPH9vA0L8?=
 =?us-ascii?Q?yqLQvgsuHnVWaVcRPtWMKUjo81gDEoiutZwHzlg6MUJLvCkjGPEl9sneV/K3?=
 =?us-ascii?Q?8oCffegDFhxAqAaT53QQKEzQcgi0qyYMzuJpHZmo9fCOYg1xrv/ofsUlWnvn?=
 =?us-ascii?Q?BKzdLXl/L/mnNWaqlgquyYMP4W1spmm3XpwneMTGtPE8NQMhIjxlTPuMlfYg?=
 =?us-ascii?Q?LUQ0Xv/3Nl9UjYcYrTkTZFp/0GZnszQE9D6akle33jB4zanjZBwqW/yINV38?=
 =?us-ascii?Q?ABbxpDspdfESD/SSVq1O6iMrHkpAxQXjZ88kTk0HvcQHbJR2BIG4qViEz0gY?=
 =?us-ascii?Q?H0rpmFckJK0+vH+YosljtdFAP+seTjDnXn5n888LVmUQWmjjPe9o23UTrqK8?=
 =?us-ascii?Q?/gWCioNtkxI0K0Ixmqm9Yf7rNi/rCyC6oCVkr0/B82oXtOljBXpfPl701bZj?=
 =?us-ascii?Q?6wcju8HljDogrx/r2g1GuPZPhzRtf4EGaLrmoWdpDkrf/4F46N2ajKZIKxQL?=
 =?us-ascii?Q?5ceJOxzb80DSN0E9ZXuDf/vBC1oWRwOH/Q+tbPS6pTWIy8cRjQeUOQ5t165a?=
 =?us-ascii?Q?a3nbTxE1N06d9xB5KbYRClYpFQQS7sXJDxP99n5UIlIbDZ5qC//Pret2jyVE?=
 =?us-ascii?Q?9LBkmZQu7YFu/mVu7MnRZ9jtEWZYuO2s3RIB4+uCzYNcdgh2gcFyqkSjD5U7?=
 =?us-ascii?Q?MvhncrJHLupK6JQXJhic3BGpKEr9szWX+lV5w+a6F+uqWavASs3LWGq2xDph?=
 =?us-ascii?Q?tOfz0lymapWo06bVAkwP6LVRKiS+u39bz1mBPWiRvUOZt41fQdEHJ6v9fAWl?=
 =?us-ascii?Q?rQzRJ8ErerZxz3Fvfkjjv9SsoxyCGECAvpaZio1hNZ3XKNfOJ8busT4iyJZB?=
 =?us-ascii?Q?97otx8Un2PwF968YyNtGfyq1/Y8CI/Ly9NL834PxY3rA/9uIfOefQJgeJFeH?=
 =?us-ascii?Q?Lclb23RQQHhqPFUQRDupha4tNboO13Ttmzxg3+tYYI6qq8QGTNueIqkjC3ZW?=
 =?us-ascii?Q?QhR3LcgWtub+jccr2606k660cBsGJVd96FoQuLW2jrq8jAJon1rCD9oIvRx5?=
 =?us-ascii?Q?ImY2qBOUFKD4e/b63K1bH2DtMQsJR8YmcbtlTi1Bf5ZVLNg8Fs4XBuXKSybi?=
 =?us-ascii?Q?yqse0pW+ad7uAGDidFjLfIq4JDl2KT57toMp12ZTLasqHqWxDjbq05doyySn?=
 =?us-ascii?Q?Z7JU4NXPZgWQ0m9RWgLV0L4I/SQyJLFzHY4Y?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KSgBi707hdS4mXTL6KA+2/vTspVqDFZ30jW9lv9Krr8sFrmoN3pdXxj/2Z3i?=
 =?us-ascii?Q?sCkV6dQZatnzvAVb7TRiC2znmWoEkA1PYGW2TjoeakqKMoy9cYY52FuPQ3Uf?=
 =?us-ascii?Q?LtSAC22ka+Bx09NycladMXJNfS+Xux+pbFXp53h66A0+i7OZn2uD+EFJu2oR?=
 =?us-ascii?Q?aV0UgMS+VOrAWBnnLV6iY1OPn7RbA4Czi4L6mLKuep54CZj6gwEvMeTiJlXa?=
 =?us-ascii?Q?+OohB28naffQ8dAJJ+udiSdoZ956K3GRmy0I/j3VQE5mXbwSkmO2d8NbltVn?=
 =?us-ascii?Q?/leaHu/+shqSCstofTL/XUq8WjQaFJ60jLQ7IPaN2bkoXcV+aYD109CEyAIU?=
 =?us-ascii?Q?cyW6zsQ/qMFKQPVgZFgGkeMZ2oMPH4Vyq5aMqa7Mr39+FBDeWcneSVlnG3VZ?=
 =?us-ascii?Q?tIcl2Z7t+3FzvGI1OUh1Bqcpd+Yu/0sc/i/CABJCC/KfhLD4AxDErvIhFf6e?=
 =?us-ascii?Q?7g/TJd6HPgWkoh2EpDPYICqZRcYLmh2QXMHy4Ezwv3ti+0UV8An3l0KSQxLP?=
 =?us-ascii?Q?o+Vx4VIkewfrFQkKLE3fQnPiyhiincUoB4MyrZWX5jP8YMjYJqKHUGgLBHv3?=
 =?us-ascii?Q?LLD0iXZy4DjZdc1KDJ0bKiiqvXS1eta6YbkfXfK/nM18RqnwIjAjJlRQ1Bnc?=
 =?us-ascii?Q?/TCbm7jvdOMoHR69MToPDAesnRLI2bLozqQvn7xdNjuuRe7envkEBr36KUQA?=
 =?us-ascii?Q?hdTxxhqjv8B5ZhWwpeTlzZz13jsFpYvlh4lKcq+RmoikaRLxSoPkoNcJPCJp?=
 =?us-ascii?Q?beGib+ZgyUHPLMGHqKMxgSAdgrPY8sRWkBfQ4NLDQh+7ty7pGTz/fou3M4mn?=
 =?us-ascii?Q?jg8a3p1DeSNCQ5CpAqzTetxYR6JwmOUqKkdlca2QPpfqEkcWuH5E9dONv83/?=
 =?us-ascii?Q?KPwnACP6WV8plDCXgsFUBShhA+Qw0cDZODeACS0o9wm7eQHtjk4ZC7dZsQgb?=
 =?us-ascii?Q?UNZ2mve4cE8md/eZb1l17B0ztVocHXdURlR/ABBAiR2efLvglCMJLRne0ux1?=
 =?us-ascii?Q?Ap+GIQEtaQu7M3kw97DB9n0Ku3AgYTAFSaTnKApaZHN4HQvF5k4/WMYSVBcr?=
 =?us-ascii?Q?SoK5gwKUfnZJjgQgevdPMW2MeTLpNRvcG6fkSWDv+vMg0faBYSYzsHdLpG/m?=
 =?us-ascii?Q?DKfn2p87CVeGxJBL/9tFNuV6/5T18He0TrieK0Cwo00JIzkACxZ5cpVEk1fN?=
 =?us-ascii?Q?t2NH1enGRyfqurq3hSJ1b8oO3XJfLLRboGNVG0m9oz3q8p8JkPqzRNzOdUF/?=
 =?us-ascii?Q?9oUT1JjAw55Ijk525m63pt6vj7/KMchXDlx64zLfHNTrbg0U9xQBT114BYkL?=
 =?us-ascii?Q?IMO8o5MsGEmd6FVas3Gu2H6v1d6CkoXYFWN4gi7WVK0mgWsCJ/EBImzHWdgU?=
 =?us-ascii?Q?OHpfQlBrscpaTB8edpAecZzRivFQ9yhbclCTXY9Ar8CrxvwTBSygX0dubgW9?=
 =?us-ascii?Q?PU/bSasXB8ecXQoH6MAxeAkDlnzO2a7Uk74OMrNhu5AtzNWcbH2gt441Tv68?=
 =?us-ascii?Q?dwCgOUnsdasqFi5HuaCzw7Lf3XVTDsGdQfp7RI4emPuFUQgslpY/3v5Gw1g5?=
 =?us-ascii?Q?qiBV3WM+IEVJ19L/wM/X+j9vQCwhU/9OzB1a7i60bCHShYELRu5Yv+YRWRCJ?=
 =?us-ascii?Q?qjlH9Ah48NGX+nBkbRA+8WM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dae7599-1c92-4f79-df18-08de01318e2d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 21:29:08.7152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pK5Uw6SB4n7TQma8Am6HmTioEuIaHP7sZri5iofua5OfJ5Gf7V7y/r6h01wj9DmKsoIp05WIuBqhiugp0D3fOq8hEVKY+WdAocFTrG3dDIRyyHW7mcp4BO7CnPzCeENs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13012

Enable the vbus-supply and status properties for USB2 PHY0 and its
VBUS OTG regulator in the r9a09g056n48-rzv2n-evk device tree.

Enabling them ensures proper VBUS handling and reliable USB OTG
operation on the channel.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 066e66b5d51a..54ed7cb2d73b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -389,6 +389,11 @@ &usb2_phy0 {
 	pinctrl-0 = <&usb20_pins>;
 	pinctrl-names = "default";
 
+	vbus-supply = <&usb2_phy0_vbus_otg>;
+	status = "okay";
+};
+
+&usb2_phy0_vbus_otg {
 	status = "okay";
 };
 
-- 
2.43.0


