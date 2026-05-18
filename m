Return-Path: <linux-renesas-soc+bounces-32741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OsjKYt2Cmo61wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32741-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:16:43 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FF8564F41
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 04:16:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EB1430010D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 02:16:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7DE2D9EC4;
	Mon, 18 May 2026 02:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="k/1BuQSC";
	dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b="KpRrohym"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mx0a-0014ca01.pphosted.com (mx0b-0014ca01.pphosted.com [208.86.201.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548E426F28D;
	Mon, 18 May 2026 02:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=208.86.201.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779070599; cv=fail; b=bs7Wo86D/0DPfmRHQJHdadLkSZS8NS1UIR5lx9c86W4JJWN6H1yrGu8q24uxU7p3m+dTuOcfE+AI/j3iID4rj1mBn4AW3R8I2ymsOV/AS7ikPpqKtdohtDIXwpV9c6EyakDbmwuQaScEwmeowglLHxPKbF1fQBikqpRAa00lWas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779070599; c=relaxed/simple;
	bh=OwDQkY6yOxczlupRVy+yeVAUvZYy4ECkRzSIre4x12g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jtw8IMBf858D2+aaozutR2oKrovJsNm0wrO8+8EB+g8+Ld5/K3QKgFWijyIihN7LdMAGhKMOnYNeGRVx2jUjWBW6w+XYi6X4Peny9C5m7Du/MpHC1NVVgeX8I2VMedcyPKAGbOmGb9+GkhFsjztRfQbkPhha9MhmJdI/VMu0TfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com; spf=pass smtp.mailfrom=cadence.com; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=k/1BuQSC; dkim=pass (2048-bit key) header.d=cadence.com header.i=@cadence.com header.b=KpRrohym; arc=fail smtp.client-ip=208.86.201.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cadence.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cadence.com
Received: from pps.filterd (m0042333.ppops.net [127.0.0.1])
	by mx0b-0014ca01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HKeEX93164361;
	Sun, 17 May 2026 19:16:18 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=proofpoint;
	 bh=htKBY5pCuzSrW2um0GXNFUkaI7JPw0etvoHRT/B/vyA=; b=k/1BuQSCHekm
	i/rUs1alppD+gAdxWsinhttztYtPxKhr6/3E0dShsO1OYDJyBj9v2Njz+qH0Gbzb
	bWBIO2kc2pQz0VqejRED0YB/lXp817DHjESNoPIGO2vax+jQWywWL3lHrd0KAbZl
	pLlJIApttZUsVXdyiGOvdAr5+e1KqF3OgzwRtFdGHWPCXuyqUaOkRU0VDmj0iaoe
	d8v0k/YjPEqDqh3vMVt94b6wiJ5fZVXXSs5vv/c85E/hUxzO5D/662Wa6VkKv9Wo
	o9rOp1QB7KVErYMlh6dtkg8HwbJxSveaUdTDsJlE50vil+N65B485M1j45doNXjl
	2jXCTtUOvg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011021.outbound.protection.outlook.com [40.107.208.21])
	by mx0b-0014ca01.pphosted.com (PPS) with ESMTPS id 4e6m5uc508-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 17 May 2026 19:16:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iO4EXOTLPaFrkb9tU/UnbsTt6qp6gDoSVU/p5sWp7lR4GTfO8FI37uKoYtw4DMEJzW8rn5YVTNPO930llQ9lpaTJwjorLkos6aFycB9k7FRSITNn7OmbgDPHGd9Pgdk/ce1gX995jlylwrSQgNBk7Yq3rZAv2GTpWrfQxFkfBawc0Q1v/3MZNYj9Yc4Q5uEOIVgJ8EvEeDfBzaFUqM7CeDKcuchOa4MAAaeghSl8ecFdU1U7dU5tFna73Pz2B3s5DPrTrq68/S4biClUH2/ch0gsr+Um9TQb/iKERzpnciQOq/SCkLpaGqeXA8PLAUt+CGlMr08Sp4dtTH332BrAOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=htKBY5pCuzSrW2um0GXNFUkaI7JPw0etvoHRT/B/vyA=;
 b=uQ/OUQFln1m39OPAw6xrKadP6Um4qKyAV7pVML9unXsoRp8i0A20kVb4gbp944RS7mkxrVdTjV7RzcST8Z2V2l8ADrEkEgWs6YDPo1nnB2MkJF3COWmBPJLBlFXbexsUslPUnTw0JHIS5bjfPk+FCrOBx2Fsnx4rALgARz1O+6/5cOCLUYThaFaGDRakn4hhjBQMeMRFnmaL7M630dj4Cy3NZSN5DcXVK5rdm4hXHZk+KYkaT8SzgcQqyYTk5ViZsW6BV2JPXQtgoNFIVIZGnnQlxvvN+aHPpiZUcW8o9FpgMHeY8WQwdWDxK9H1PsXKlBhmHo2oiZkalbc3tQrhiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cadence.com; dmarc=pass action=none header.from=cadence.com;
 dkim=pass header.d=cadence.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cadence.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=htKBY5pCuzSrW2um0GXNFUkaI7JPw0etvoHRT/B/vyA=;
 b=KpRrohymrMtOJNpdqWCknYH+TiBlV5Fj7kDxR2RBpm1X7WkwHCtVwkWyeXNZSWxuFVE4sQnpef8y/vkXb9LoUhJSqErEsYz1b/kqFJgmvqdM3GTQF6A11Ujv91hJZbWSCnz9rp3ItxHtoyxlYle5aeuBx5JxI1AexjKZz9CD5x4hRGtIewwDKQ0XwVuotLUnLiCEp302oUrJYpWJo/LUN4efgF1Z7IuE+UaUfGbR1E3Crx4qqXanVNbRamLUDEwZOTVfZqa5HeDvtVL8W6Z5bg7qV1sO+i698UEQD+769NzMFc8sANEFClBRwc8iG8vCO9SVau1KgfEd2ipuPAaYSw==
Received: from DM6PR07MB6716.namprd07.prod.outlook.com (2603:10b6:5:1c9::16)
 by PH0PR07MB10779.namprd07.prod.outlook.com (2603:10b6:510:335::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.15; Mon, 18 May
 2026 02:16:16 +0000
Received: from DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175]) by DM6PR07MB6716.namprd07.prod.outlook.com
 ([fe80::2e20:ee0a:1b4:1175%3]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 02:16:16 +0000
From: Manikandan Karunakaran Pillai <mpillai@cadence.com>
To: Hans Zhang <18255117159@163.com>,
        "bhelgaas@google.com"
	<bhelgaas@google.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
        "mani@kernel.org"
	<mani@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
        "thomas.petazzoni@bootlin.com"
	<thomas.petazzoni@bootlin.com>,
        "ryder.lee@mediatek.com"
	<ryder.lee@mediatek.com>,
        "claudiu.beznea.uj@bp.renesas.com"
	<claudiu.beznea.uj@bp.renesas.com>
CC: "robh@kernel.org" <robh@kernel.org>,
        "s-vadapalli@ti.com"
	<s-vadapalli@ti.com>,
        "linux-omap@vger.kernel.org"
	<linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "claudiu.beznea@tuxon.dev"
	<claudiu.beznea@tuxon.dev>,
        "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>,
        "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 3/7] PCI: cadence: HPA: Add post-link delay
Thread-Topic: [PATCH v4 3/7] PCI: cadence: HPA: Add post-link delay
Thread-Index: AQHc5l9SNwDUE8yA3UakYQnPIo/mH7YTC4DA
Date: Mon, 18 May 2026 02:16:16 +0000
Message-ID:
 <DM6PR07MB671635EE7FF28BD2FA5DDE36A2032@DM6PR07MB6716.namprd07.prod.outlook.com>
References: <20260518004246.1384532-1-18255117159@163.com>
 <20260518004246.1384532-4-18255117159@163.com>
In-Reply-To: <20260518004246.1384532-4-18255117159@163.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR07MB6716:EE_|PH0PR07MB10779:EE_
x-ms-office365-filtering-correlation-id: 82e4440c-9710-4360-ef24-08deb4837131
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700021|921020|56012099003|18002099003|11063799003|22082099003|4143699003;
x-microsoft-antispam-message-info:
 Qf5fEPqyqn10thv0v2yQWFMM5DeH43ZUstfpCfcusSA1qMR27R+u1m/SgEjUAXv1o6WlLqul0f7l5o1o3iYbaSBhot6M+qmGurOsiR7Q9knKtBxDTaSyx1jnv04Ob7I06gly9KGPUirEHcTddkk3AXhnDwzwp0yUzJFy/5YegLonD+rw+i2q6aTvWWAcs/rOsmcTvur5JKocfbHTcpnVdaVM0j3M3mcdhYF7kt9GjEek+Kl9ij2OkIcUuJ5sB290DnAdFwsDR+F9YiKhdhw3Et6WxJrxRZ1AOv8YD0PPkNdboUGTL7m+DlV0mmsUIK+knGYycfo+qy8CyZLrP1SmqOfqm7qeFmQG6D2Si+6GvwVPmSI1JelvEoet/hPF544qMQWRRx+7vYdI6ez8rkLYze/910Chm7lsmgIQw9pfZLSd8AHagJJHM3akDOR0ssAED+myU3r1CGJjRinZTwQCVjnPdPqPmVqM3xl9dx+aR6Uln5gW73X0awwEYCn7EKa45I3+J9Pgai+i4J0j0NvabkG22xW5A1X+oqfuZN1oEPStB383O/vCf+mA468ZdW4SuUw2CAfLoad2eQtBM9jPIv40ddrREIImJQPdbop/4VUBXq026aPsY5yCtpUrC5p2klTejbFhmunZHpoAVBSwZUWtRl33L4OZSHWl4FGXFZwThkEvhLn/tQTEzQL0f58yBa/n0go/gzXrNfwxKx7XIhLiqd7zWCz+TyykIPOvteW5HkxgtOJKkkAaahUGk3fyAdkrYMnJzmBz5BogitV0Qg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR07MB6716.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021)(921020)(56012099003)(18002099003)(11063799003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?lsPSkZIOyM1HHT/qykFR9QgVxKk6kTQpPmWwbjjnt4lBj2hByaNJFjMCbSgI?=
 =?us-ascii?Q?H8ro/6EV8v3TMoPbtL0lxO7HttfnZMADt+E5Vz0Bp0VvkNY+Vl7X7KOg8jC5?=
 =?us-ascii?Q?fEL79oLcVYDnii+QtRrX4WN+HV4LVCPW38VX34XdciuNNkpdPocrH4AE6IV8?=
 =?us-ascii?Q?6ImG9QOGY4Yu/yxgcF2pHTWgcaty3LoH2Gu7vZD9nhfoTGcoK1COcHBS8ot5?=
 =?us-ascii?Q?fkQ0drkkxYeiQkZwzr8ncS5W61G4x3v3uL9hH07DL1xvC3UkMI4Q9H4m3nVi?=
 =?us-ascii?Q?Yt2GXOXT22FHU/dTIYSyR4ajfnJ/f2zUZ90sKUSQ8SL0PJcQ2LFKMmP0J1wY?=
 =?us-ascii?Q?WGDlkJZg/6e9Ck11swppJbK1JAYtcrsu9EQljyJPC6dexKJUmYFnaoSkbz0k?=
 =?us-ascii?Q?N0HkB4ULBP2cRxw3fC0iDr3hMHgAjJJ64mycs2xmugD2lOz2KNZoqjA5wzk6?=
 =?us-ascii?Q?2GQ7hnPURxzamlmHa88e8vW06QGgfG1zMlCksMg1VpH83FakYXZk8VYiPdov?=
 =?us-ascii?Q?4Q4GxGOjG2+B65ox6yv1RWFzkfnWMXF6z1dttsxyxFc3GHQPnle/EytlY9Ak?=
 =?us-ascii?Q?0+NWCCkhLMokS+JRZNUis59z4hkGiIlYah+EVi4yoni6CwvCTGPtMjgmo0jW?=
 =?us-ascii?Q?330sccwYGj/XPNiktmoIIPT2xbz/D60ZlQfV2EYjRv2pxT1QwkmWpKTSH1/2?=
 =?us-ascii?Q?rEoCf08JLANkF+qCY2biilFaRlya/cNRGXhKck2n2UZoJrJCtqpPBfDg7Q5O?=
 =?us-ascii?Q?eNVS4e1PzViYQhWliL38PVGKpJJp+PR0SXqEC9NzzqMrHAQPXOwcAenuFDOG?=
 =?us-ascii?Q?g2/7/8F5FmybIoi+3BotYd5dMXMO4DgrbDOK4PL5mUEKR+o5P4YPXdl8sfEg?=
 =?us-ascii?Q?UllfhXz4lGoUSfrlEkIRkkjc/ChWjlW/994R88PVJEYSGfS8O+xmN5nnDnxv?=
 =?us-ascii?Q?2EQzSBT51KfTZHx4xFIL7rAQOi/elWfbKVEtjIG4Cnn6ibt6qz/+8mc1GiDE?=
 =?us-ascii?Q?xiYkcMp69I9l475kKmgih0JplMssBuT1vqGUui7B6666ElorrQQYILEH8g7t?=
 =?us-ascii?Q?5ocehlb7NxhAQlE5uqdq7uWb3N7SUDfXC1Rzoyzl8ryaUV5aaYbTpsMnaSGC?=
 =?us-ascii?Q?iuNlr7FMIs6XB2IZs6bMYzTFzFqRe1n7pFAMQwk7jARjfPZA2XTrgtADja8n?=
 =?us-ascii?Q?csC1VUYclz/3N0LA25il8Ox3z9nZicKVxrpN0n/FV/sagqmSflCCv9EtyDtj?=
 =?us-ascii?Q?/1O2djQogmR6+Ed9AIKQ76mCIEG5mUvGCutECop8OfVHL9yw5ImMfXXVMdVi?=
 =?us-ascii?Q?A0ozDO1gK5M5IAV4AnjvV5CVBxUvLOOrCiWIBrWytnb9jdRoUP+XSTliIiTi?=
 =?us-ascii?Q?+hULvTi5XzEaHQixuXKN/COn8fkjZOdNZOerK4lPY3QK3bStoY5v4cOS4Oy3?=
 =?us-ascii?Q?uk3HeH05znaPPsjb/h7ZVAplHlQBgw4V+xvGpyg9NaW9br4/oDiLNNi+TLt4?=
 =?us-ascii?Q?m+bdcFi8dU8xj9XawgpooYMhaAxjGvfgLCG9I8KXk7HPnj9XzVZoszY0AsSV?=
 =?us-ascii?Q?6M1K8r/6BL6wlKInMwXciMQFo9wq5JPvCriiwG+0KAMz32dazrcF34s1VMYq?=
 =?us-ascii?Q?EPVwgF+qERpHRT98e+hpCug/KYXeICzCFaKINHeBVU0p58MHTAu8P01G9fTI?=
 =?us-ascii?Q?zSE5gg/ZuR1F7Jp0vW/S42qmfnSJnxTs7pZQGUYeJt0G9zKYe/HwYmlXjMEM?=
 =?us-ascii?Q?LB/99kHH5g=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
	UUCxRyY/A9aK6ghO7ukZMMnpVOkzPEs9d83mVx4yZRqxSns/YD+m1Ep8Q4sau2L75dy0cQk4VqjmLIwsVXJG9gquBQkD7PlK3La1Gih6BrhowQ6e6yYm9tZlzeVXMl5jtg8f7g/qA5RnIy9YUgsWjzFGL3HbE6cGdeFPqBTtMLU3JER5VNX5T/O8mCEOyEuf/yQpqnZSf1XYCropL/ocygOegKqfTozTrJMY+6VZY270YvgW2frIuWdRPfHlmbC4GaG21orDR5wOCYMIJ4rQHm+KPhdK4ruSZwXmsaPGBbj9ddamM2FiJjLqjS5PuPfT7KH/AclgQDW5lc8Jd6tILw==
X-OriginatorOrg: cadence.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR07MB6716.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82e4440c-9710-4360-ef24-08deb4837131
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 02:16:16.5817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d36035c5-6ce6-4662-a3dc-e762e61ae4c9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RYWsmqKwdNnoLuumAjwl+HBtHlWDyu2Rh+XQjCZCxxrgOcMRmV3kwmGrAmLfFg470nVbk//XJ245mtxm8tdjGdOLfNzuW2JSlnrRjQ8FT9c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR07MB10779
X-Proofpoint-GUID: ITj4x28unaJGkV493wK-62kaKebMKPJ4
X-Authority-Analysis: v=2.4 cv=ddKwG3Xe c=1 sm=1 tr=0 ts=6a0a7672 cx=c_pps
 a=6VX5YHTAOo6o8GlK2BM1ww==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=Zpq2whiEiuAA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=W8fx6O4W8wtO2w6lYej3:22 a=tuMieXAyK57eGGFK7xkD:22 a=Byx-y9mGAAAA:8
 a=Ka8ycDWzrfkhc119FHYA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDAyMCBTYWx0ZWRfX0/j8Rz6ojhUa
 eVjL1YLI2i1sEaAopyyokYADU75bqelVXZCtdsoYGCHZ8ScSOYkr6Wq8MBWoTaDLC/DoTJuH1xD
 qaETQh1US9YKKwdQ8FEunAyEN8ot65q0RL11S1foR6ZL40JR9+BiXOd74P5k4Ty3CQFmcr5erUH
 WDQBlwnOCVyHlkxgfvcnSCBiubxdVFzJ8/xGa+a91yZogZpxqwOJrMTY6Bs7BLTfJnYxoH90dn4
 DCM+mPeXmfdwFdkt7vjqjLL9AmXmG5t38mDsNz1NP6+70VtGZ+AAZ3VT2ZxrbHtmL7Ohgnpq5z9
 3KoqUI2haPv5S+vsCNobasR8VWVdyZrWSwFcQ3eL98X9JJOvHKEDX4mWaS1PFz6qsvKf5fLrMvH
 X7/V0oOB/01N3g64dkxcmMOwItjSyrOdY5jY24sPDqRNMa5v+ssJRRc2c79DhtSurdKWjv0E4Bm
 gGiFXo8qTNA4vNJgvmQ==
X-Proofpoint-ORIG-GUID: ITj4x28unaJGkV493wK-62kaKebMKPJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_check_notspam policy=outbound_check
 score=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180020
X-Rspamd-Queue-Id: 67FF8564F41
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cadence.com,reject];
	R_DKIM_ALLOW(-0.20)[cadence.com:s=proofpoint,cadence.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32741-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,DM6PR07MB6716.namprd07.prod.outlook.com:mid,cadence.com:dkim];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[163.com,google.com,kernel.org,ti.com,gmail.com,bootlin.com,mediatek.com,bp.renesas.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[cadence.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mpillai@cadence.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



>EXTERNAL MAIL
>
>
>The Cadence HPA (High Performance Architecture IP) specific link setup
>function cdns_pcie_hpa_host_link_setup() waits for the link to come up
>but does not implement the required 100 ms delay after link training
>completes for speeds > 5.0 GT/s (PCIe r6.0 sec 6.6.1).
>
>Add a call to pci_host_common_link_train_delay() immediately after the
>link is confirmed to be up, using the max_link_speed field. Also, in the
>HPA host setup function, read the device tree property "max-link-speed"
>to initialize max_link_speed if not already set by a glue driver.
>
>This ensures compliance for HPA-based platforms.
>
>Signed-off-by: Hans Zhang <18255117159@163.com>
>---
> drivers/pci/controller/cadence/pcie-cadence-host-hpa.c | 8 ++++++++
> 1 file changed, 8 insertions(+)
>
>diff --git a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>index 0f540bed58e8..8ef58ed01daa 100644
>--- a/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>+++ b/drivers/pci/controller/cadence/pcie-cadence-host-hpa.c
>@@ -15,6 +15,8 @@
>
> #include "pcie-cadence.h"
> #include "pcie-cadence-host-common.h"
>+#include "../pci-host-common.h"
>+#include "../../pci.h"
>
> static u8 bar_aperture_mask[] =3D {
> 	[RP_BAR0] =3D 0x3F,
>@@ -304,6 +306,8 @@ int cdns_pcie_hpa_host_link_setup(struct cdns_pcie_rc
>*rc)
> 	ret =3D cdns_pcie_host_wait_for_link(pcie, cdns_pcie_hpa_link_up);
> 	if (ret)
> 		dev_dbg(dev, "PCIe link never came up\n");
>+	else
>+		pci_host_common_link_train_delay(pcie->max_link_speed);
>
> 	return ret;
> }
>@@ -313,6 +317,7 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
> {
> 	struct device *dev =3D rc->pcie.dev;
> 	struct platform_device *pdev =3D to_platform_device(dev);
>+	struct device_node *np =3D dev->of_node;
> 	struct pci_host_bridge *bridge;
> 	enum   cdns_pcie_rp_bar bar;
> 	struct cdns_pcie *pcie;
>@@ -343,6 +348,9 @@ int cdns_pcie_hpa_host_setup(struct cdns_pcie_rc *rc)
> 		rc->cfg_res =3D res;
> 	}
>
>+	if (pcie->max_link_speed < 1)
>+		pcie->max_link_speed =3D of_pci_get_max_link_speed(np);
>+

Similar queries as for Cadence LGA controllers. Why do you need the max_lin=
k_speed check for "<1" and
What would be the consequences of not defining the max-link-speed in dts ?

> 	/* Put EROM Bar aperture to 0 */
> 	cdns_pcie_hpa_writel(pcie, REG_BANK_IP_CFG_CTRL_REG,
>CDNS_PCIE_EROM, 0x0);
>
>--
>2.43.0


