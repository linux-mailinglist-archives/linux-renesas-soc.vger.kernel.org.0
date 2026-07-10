Return-Path: <linux-renesas-soc+bounces-35069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4zgwAuokUWrF/wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 18:59:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E6573CD3B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 18:59:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cirrus.com header.s=PODMain02222019 header.b=GE9u7lhU;
	dkim=fail ("body hash did not verify") header.d=cirrus4.onmicrosoft.com header.s=selector2-cirrus4-onmicrosoft-com header.b=piIz7mDT;
	dmarc=pass (policy=reject) header.from=cirrus.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35069-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CB0B303CD02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 16:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5011343E9C6;
	Fri, 10 Jul 2026 16:54:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98FF36C0AB;
	Fri, 10 Jul 2026 16:54:52 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783702494; cv=fail; b=B9RO0B+3+/9h+JLDrLRrbyGXxIpeGlaURgVlVQ7YNlNQzdeqQY/ZrQNo9dbXCEDPKoURrsi6quuAIWspnkfQcOQrj3QULSSjoz3nihQ3CQk6qrSA7jdxMr/IRXLO48WXUWPrlYxSfateburqAY3OsTUT+pWmnvsXrzQ/adjALyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783702494; c=relaxed/simple;
	bh=NR45ycRzkLU9ejaysk0XYyYfHofrTG/rBlX3v3IGvo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dwucm5AhzfYBnxUz41a3g3D5AtYm8i7/Z1ga4HglOuQwVXiwNIM9zas7SIBnNa+cJ+cnjMkN+EQDOsmCt13niSnufVF3aepB72QHLj5IaR3pCXBW5ZHN7fcBMXILvpeu1Lje9SXxcCLEswWGNvHlWx2CdMJ//G41jsJxqB0LVNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=GE9u7lhU; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=piIz7mDT reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AEkwLp3337969;
	Fri, 10 Jul 2026 11:54:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=WsfF+mbRDPD+GsPWqxzNZj+dFo6F1e9HzKDlJXCosvc=; b=
	GE9u7lhURyNL+eTo/OdMcVkqkDFiwsWZlR+aDNVMTBARCjC2zqdI8W+BULvhCWu3
	j3Rbbp3pPiMtI73Xgs3sUPdhUeRmMzhTZNEB13UMWCU/hIkjrrMmfI+OTXm3aFpc
	63cX4lxcX047b4cwgMJkLJe0UdSMcQcY4zo8B83yEijUZwBODV14il+1ILRxbN5K
	UPoMng1CArzavq1MzwbbQCfp2M97jbiNf5mOsesepWNZwx7IFQVtwpShzRsFbVjB
	HHz9Re6tc7OcnJ1UwV5sMUMBgpaRvyaEi7h5K+QPlzPjnWPceQbH+hRZYoqDsXXM
	x2W8es3UmIIJGGpAW3i80A==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021134.outbound.protection.outlook.com [52.101.57.134])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fb2t6g7be-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 10 Jul 2026 11:54:19 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvZJNENh7cNx+HzMNwGICXqY48LWLEwE5ZQs1lGtcuc44MxaZ9kml3oiOK2uvnr+SvarIi23eV5EgObyj7jP4ht9wx+8dj4tnqgWHmUCC/nRdoNw6Z9GFyBs+RPo1WUtSdVs2AWxFunRdEf6r6hQKb38vhPlpgsrIWkariie8rQzTsnSp5Y+Nv7MZAc9h4phgGq92yxSsLGgIpcdkkeYJEQjE6Y+YxnaFkJR8W3xI67d4D50cMX6qRdN+GGUwjjXBpPQCZAcHs5tOeATfGXYUSC+nnu5pjpGyuedbGpjX99r6Aa+E6ePRtrPIJlg6PhUTZ+oIKsveGVAWz1u2G+8rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYaBMSvSvX6TdwuniTCPEburPNpHEzqff4k2rv+0oJo=;
 b=vywk/NVJW0AQtXVCxk/ZivbV4hPf1PhHrcOIERLisnozVf+Rz8GXRFzWyKMTN0e/tTJo3t6H/ul1U4L9VQ/pt7hBuOIT2wxDmFs3QnpCFQA0UHoqlNhppcOhfRrElHJOtJduHZIi7kKLEizf+p21R3duEQm1HT8mKoy7X5wtQw+ay5DKP1h9uuwWAiIABmExHTjsgpfvsWkVdczj0H6VREh0ipo/bRA7zhfQIwg0RMBVKghHC/tpB1dsHjtjjm7strW4EP2BkRIsUCiuMstpkCl2IdHOtjD8Npk4QziFzNIir1lq5Xt6ZkM9DULWGKpukYTsUSB6ZDO7v+Eg2GoNeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYaBMSvSvX6TdwuniTCPEburPNpHEzqff4k2rv+0oJo=;
 b=piIz7mDT96dCdvMPHGgKmg8TxMRUY7sCNlcF0ANVRkfI5MK+h6Bu/V/osG6ZGJV/xqMY8/FHnZxwvJu2nK2jB2DA71jsfRLhCmqos99x9ILemFN3LLcX9EURAf9OaCALXeucoHMNVZh3UF5obI38gHJ+z05GcXoKMnI1PCtRxM4=
Received: from MN2PR01CA0057.prod.exchangelabs.com (2603:10b6:208:23f::26) by
 SA0PR19MB4458.namprd19.prod.outlook.com (2603:10b6:806:b6::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.17; Fri, 10 Jul 2026 16:54:16 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:23f:cafe::30) by MN2PR01CA0057.outlook.office365.com
 (2603:10b6:208:23f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Fri,
 10 Jul 2026 16:54:16 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Fri, 10 Jul 2026 16:54:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E590B406542;
	Fri, 10 Jul 2026 16:54:14 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BEE57820244;
	Fri, 10 Jul 2026 16:54:14 +0000 (UTC)
Date: Fri, 10 Jul 2026 17:54:13 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
        Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Chen-Yu Tsai <wens@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        James Ogletree <jogletre@opensource.cirrus.com>,
        Fred Treven <fred.treven@cirrus.com>,
        Ben Bright <ben.bright@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, Chanwoo Choi <cw00.choi@samsung.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
        Saravanan Sekar <sravanhome@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-amlogic@lists.infradead.org,
        asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 21/23] mfd: Unify style of of_device_id arrays
Message-ID: <alEjtTiSvVTpc67y@opensource.cirrus.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <e5cc82aa51da5f545f745b126923fdd6085a68a0.1783615311.git.u.kleine-koenig@baylibre.com>
 <DJUWS6ZZUDS0.2ILHWRFQ1XD1S@bootlin.com>
 <315a0aec-99e8-4d03-a04b-613acfae1f52@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <315a0aec-99e8-4d03-a04b-613acfae1f52@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SA0PR19MB4458:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d4dfbc-63ca-48ec-9d6e-08dedea3e07e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|61400799027|7416014|376014|23010399003|16102099003|18002099003|22082099003|5023799004|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	5/4Lr+tbhbqPodXSAkHEkh6L+55dCUessVj57Kp9Q+4XjSNmxV3SPlUCPJswooj6I0DfpPMChZFRg/9aqSndatwrDrnKIMPZG4bPvpvR48g7gJ2P6ob+n0O2tr0wJ1hn8xgYWV65E3OGE2xH1QK32TjpDjZhF62C06dJXFq2tKUU3pyYU1yzfIYSnXIeDJNy3p/eNmO9csNm6jTAXVy1hXD4jJJGStJVubc/w0U1QBvmBTSTX/TseMeNQRpdM/eLeYkML0MA34Yhr5Ipu6ZGB9hihDhkEY61lCiLdaZHEAHrdsrRZjsmbdlBtK++wKxcmpro6YnKFnhnXCNrv0sW/N94J+FG3JQ3rFct0wzbKdvlNLWptp84FHYvwmP2uRX3gaVl8+sbO7IpniVMilHSo6Uac6mHi/M4DvIvFF+3gb3xLP9mkxwkDPxe/IQ62SBh1pNk8JcUekPcLFaLpyGdHyUEGO7uQKx1rWhmNYpvACwI1/C/rBJqtqaDTQ8ZddCQvMLASNEOP2CXwGDRKR70ABoziyOKTZQb5KzR52HCj0gh/dxxMPiWx3uB44wY6Xjb83Q2qJ3oZq2N0qycDMioUYGEJ4rri3j2QZLQWFtmkl6tAhn6RtCECF253Za9SwJdQFqAFTLUj2eraBiYhVsvuhW15vlm6olEUesNBC3uuOIuApI7+2ibcVHVqR6BowvNI54iKEBp2PEFWnRtdJJLZg==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(61400799027)(7416014)(376014)(23010399003)(16102099003)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JoOFsxH1ffJr3SMgRwVqC4RiJg6aW2HJU7koyN0AjnX/OVLH0tXhb5s11mMmXHgkIeJj1OQv+fMLQ/J5QHx3GeKewE6eMEsI5w9NiBHVUSA0XmL2lyCzhAskRQ6rPVu9f+4lN2gWXg4Ad7fhbyCBgOoIXp8AQTqSmSzDV4bJGzcTHs2ifj/k3r2pSeAbGpnCZ+B7VvhFHNa7MO5KdsNFhLMmwRYENyVIuJmu9JZ9jV4omu+9U7F+2NM8cSmd+ZTrTBiY80wLtpu6ATvVZf3K6eFe+wHnnPraFTnqxGTTESbn1UNLhGQdyg6EijOpdxMCnwcK/MQ+p9RHV+gowNhrAd/VPzQpliVaosUYbEH5gb8X3Ui00fu0Brq8MrrdpoDDg5bYhIyBky2hk4pkbaerq4fMrGFzwmESrpV8UNTSnlO21qNbjLqzn60nenQoCUDB
X-Exchange-RoutingPolicyChecked:
	Xp101HBMD9YUUXSGEQN6ky2NAr3PtWXk0VOnL7cTFQQFJTuYwyNLANyxUDK19qFP1uKuMR7DUisWRdwwb/fQDh5njNbIJjY7fFmKNe7K2u/cTiR3Jf5M93KNA98fHws+n0XGtVoeLcGBB2AHO6hjJPrzoecfZNzqvCp6f/62wKHw7EyHvOF75wHHBUE8I1a4Bzfxb4+1CdkxZ4wZISubVl8U47s/IiNg6jsvkgMLKbDsFEI/4Q9/MkZyj7S+CKPkX6mj4brl7UDn1tL3EC8ObxNq9w/RVaprqm9LH5IzCdZ6Al6NLquhVFJALJD/37jmyfmMXtYAxjHAWSE3ePQdiw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 16:54:15.8418
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d4dfbc-63ca-48ec-9d6e-08dedea3e07e
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4458
X-Proofpoint-GUID: 25obz_yyNkCnp7YlV3Vkq9nrrYZ2wkQZ
X-Proofpoint-ORIG-GUID: 25obz_yyNkCnp7YlV3Vkq9nrrYZ2wkQZ
X-Authority-Analysis: v=2.4 cv=LNBWhpW9 c=1 sm=1 tr=0 ts=6a5123bb cx=c_pps
 a=5CsiemZREWOr6tJEzaiJew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=tVKXKcanaTD3nCZxYbUA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDE2OSBTYWx0ZWRfX/oW/6gBxVPFi
 Qhi4uwSdb7NM/Uf8jm/aoJCHoFK3nEX5W7ba+ZDO11MzMmxW9p1Dgqw/yLvM6RA96yF+nP0zYY8
 RL+yhsPLS2xZqGRLHDOOmhIN3phX0ygTMbp8ZEkbk6XATyW75ZSjP2fm+ZqsAE4ya6Cr2KzWKno
 iUfpgPowO97vk3z9Y/bxfI1pRehKQ2mhRaFaoQzJvURF2BKFOHw5JIfCFPc1Gue7sfJvLlOY7/p
 oNPHLEYYQKcs6FTVrN73cIuL3JYyBetIHcAfiKiPOz1SnlHE6BRpuAnNlGU8JcgYko2Wv02oVCy
 VEoTb3RTeC1is2wwc5HQpjd2wkDV+xorAxoFY59BmQ2mKSQpzjALauOc51MJDWgwYZVB4DrdRMq
 jTnfHplE0sTfv0wPtR/2AfXJCUjhYn8wAL36RTgHUL5k0axZQBT4OkrnXYqWoFbJ8eM5y8yxodP
 RGTzm1bOz1vOi0gH4fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDE2OSBTYWx0ZWRfX1hRY44W9w1P2
 2Avh9ilPdk4PhQ1wNCnK5zb4FBq0ljGqyJ8nhmkgQM84FP1Mh41Ry2uvFhATqpceGJ3HPcx7ejW
 5s+ovOGNZ74U/NKh3LKFpGM4F4+GdBA=
X-Proofpoint-Spam-Reason: safe
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:mathieu.dubois-briand@bootlin.com,m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:linusw@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:wens@kernel.org,m:florian.fainelli@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:david.rhodes@cirrus.com,m:rf@opensource.cirrus.com,m:support.opensource@diasemi.com,m:peter.griffin@linaro.org,m:alim.akhtar@samsung.com,m:tharvey@gateworks.com,m:neil.armstrong@linaro.org,m:sven@kernel.org,m:j@jannau.net,m:neal@gompa.dev,m:cw00.choi@samsung.com,m:luca.ceresoli@bootlin.com,m:andre.draszik@linaro.org,m:sravanhome@gmail.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:j.neuschaefer
 @gmx.net,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:mazziesaccount@gmail.com,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:liviu.dudau@arm.com,m:sudeep.holla@kernel.org,m:lpieralisi@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:patches@opensource.cirrus.com,m:linux-rpi-kernel@lists.infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:asahi@lists.linux.dev,m:linux-mediatek@lists.infradead.org,m:imx@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-su
 nxi@lists.linux.dev,m:linux-rockchip@lists.infradead.org,m:marekvasut@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	FREEMAIL_CC(0.00)[bootlin.com,baylibre.com,kernel.org,microchip.com,tuxon.dev,broadcom.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,linaro.org,samsung.com,gateworks.com,jannau.net,gompa.dev,collabora.com,nxp.com,pengutronix.de,gmx.net,iki.fi,kemnade.info,atomide.com,linux.alibaba.com,foss.st.com,sholland.org,arm.com,glider.be,sntech.de,lists.linux.dev,vger.kernel.org,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35069-lists,linux-renesas-soc=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[ckeepax@opensource.cirrus.com,linux-renesas-soc@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[cirrus.com,reject];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,vger.kernel.org:from_smtp,cirrus.com:email,cirrus.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,opensource.cirrus.com:mid,opensource.cirrus.com:from_mime];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[75];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 53E6573CD3B

On Fri, Jul 10, 2026 at 03:15:17PM +0200, Krzysztof Kozlowski wrote:
> On 10/07/2026 15:00, Mathieu Dubois-Briand wrote:
> > On Thu Jul 9, 2026 at 6:58 PM CEST, Uwe Kleine-König (The Capable Hub) wrote:
> >> These arrays already mostly match the most used and generally
> >> recommended coding style. That is:
> >>
> >>  - no comma after the list terminator;
> >>  - a comma after an initializer if (and only if) the closing } is not
> >>    directly following;
> >>  - no explicit zeros in the list terminator;
> >>  - a space after an opening { and before a closing }, a single space in
> >>    the list terminator;
> >>
> >> Adapt the offenders accordingly.
> >>
> >> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> >> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> 
> Thesr are all Acks, not reviews. Entire commit will now carry multiple
> review tags, implying it was reviewed by 3 or more people but none of
> these people actually reviewed the commit. None!
> 
> They looked at one line out of 100.

Technically 16 lines out of 375 ;-)

> This is ridiculous.
> 
> Quoting:
> "Reviewed-by:, instead, indicates that the patch has been reviewed and
> found acceptable according to the Reviewer's Statement:"
> 
> Not piece of a patch. THE PATCH.

More than happy for it to be switched to an ack if that is the
preferred process when reviewing parts of larger patches. I have
always just indicated the parts of the patch reviewed whilst
responding, apologies for my ignorance of the process. Would
probably be an idea to update the docs with a specific comment
for this case I am not sure that is as obvious to me as it was to
you, and it is very common to be reviewing a part of a larger patch.

Thanks,
Charles

