Return-Path: <linux-renesas-soc+bounces-29259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLPIDbM6smnMJwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 05:01:55 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0C926CEC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 05:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3562E301E9AE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 04:01:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E4C388E7E;
	Thu, 12 Mar 2026 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="S0/hi94O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011037.outbound.protection.outlook.com [40.107.130.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98A9367F53;
	Thu, 12 Mar 2026 04:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773288113; cv=fail; b=fUMRuNBZxJYeJDqb0mbuaVTEUDHUlG45Rr9Ri3JuiJMlDtANyTBSSoM7Imdit9v+8IhWTBRC9lJJ893mHqOOh5PWkTf3gSmuuBM0ZEtUdJRQ65B5fIbGNvuesDR9WhMD7tYa3PW6E6axyMb3Vt95EiZHtSDjAbnh5Uao1REpl98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773288113; c=relaxed/simple;
	bh=HFFuXg2lPn1hn1x4qhRBhdnAFAEaAQd853imS9sfgVc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bXFKBBTiqbCU9w9eYzI0rz80bVjKiDxoA6gT4NYCZ10YYMTPcb2o09mgwok2umo/ZU5+QGBPJ8Jdn9buuihzMR7E3PR7St7LK8GQIYNHw96DoQKOTEZ8ihqAwV9LzV46+C3EK8oXTdODcqoxK4f3oNChawCmv1PvVIcc3jtzMi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=S0/hi94O; arc=fail smtp.client-ip=40.107.130.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUymlzr7SsoWVr/X/75ItQsRSm7X7zXcm8pa5s3AvUI4jqXlay1u6wFnWWwbtlMdI8zMcI90AwrVTO7qTilpwPgV5g9aghkV/CFmWDC3WHTQWUeVwBHxDC6K3A+gtCipGt+Hai1WT1BJiSpgglxAjJBiRjDa3V81gKIqjqksUv2nDspzDU7mGtXQd7fIX7tdZFD6qh9/jYvwsI/6lzoQx6K+m4kUOEUvS24ifKJB/z7P2CvEt2If+xPlapjeS4DLU7FP2NwsPo4SEXH2eSAA0U5ikqhe+2Gu9km5xd1aXmnVLyH1qI5m9OgR/5Yj/wz3jqZ5yFrqraf0RWAVmwEY/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7tFaVnNkUuXKbnGGMR9Dwryl8VU2bdT7+4LDhUK2aU=;
 b=G6dKqsPibU2YDq3sH0sXcCcz5OmlLm5n5jyvXS1th4E5z95XMaeNxjncNdbaPIHL/F6PbhdPQxtciqS7v5x5L+lYsk0zokC9+gHKhDV4xV6VD5CQG2k2llCiIW5fujShivJVRNmsuNLPNi4c/CEZCfssXxf0VPdYybehT2WpNQ9+yNiC230oeE4ome4FQCHCZ/jJZOHyc5BwdwUYZ+2zys0+enQyaDzXKoJZCWJXflVq9K8UjrNcjkigXlTD6k5wV/FQDi2BPowInRF60QSrP+rwwnQJDL60g7rWcw2eHg0BydEz8b7BOpRY4U3L2ka3lnOoNpralM+ixo8tbIwwzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7tFaVnNkUuXKbnGGMR9Dwryl8VU2bdT7+4LDhUK2aU=;
 b=S0/hi94OsfnPvlvkM/zmgGaHSE5PL1eSNxX1v6q3xbScoz1pvUXhZCyrFWyyzXTQj2dmVOe9PVZQw/+XDv23TjFSJDP/TMcP1MJpaHVVcmzPEk8DEnK4mkRVgxpoA/+HQ+PAlV/tdYBnTgVCvH+/vEOo7LGk4tinSpokN4Xh+EchgZ6/ERTShorpZdKRiPZbdGuZA6rFIY3mXBrCOaGc/sOB2byF13kM72uscfIwzv52Fst44ng1qO6cIx8LMj+wXeiY4C3CUMufiFZr2I4Kn9ec/vbH6iGWSFMUJjSXIc/3IWXtsJdmKKzIuOfNI7o1YyO6KnHrm8ZxlKPlVD+NRQ==
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AS8PR04MB9208.eurprd04.prod.outlook.com
 (2603:10a6:20b:44f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 04:01:45 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 04:01:46 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Hongxing Zhu <hongxing.zhu@nxp.com>, Lucas Stach
	<l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Yue Wang <yue.wang@Amlogic.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, Samuel
 Holland <samuel.holland@sifive.com>, Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Pratyush
 Anand <pratyush.anand@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
	<linux-samsung-soc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Thread-Topic: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
Thread-Index: AQHcrGg90l4cssg9x0eKOTwnCAcKBbWqR/3w
Date: Thu, 12 Mar 2026 04:01:46 +0000
Message-ID:
 <VI0PR04MB12114053B5BE9CA48CE107D299244A@VI0PR04MB12114.eurprd04.prod.outlook.com>
References: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
In-Reply-To: <20260305-dt-parser-v2-0-85836db8dc06@oss.qualcomm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI0PR04MB12114:EE_|AS8PR04MB9208:EE_
x-ms-office365-filtering-correlation-id: f1a0c84e-dd8b-44a3-0301-08de7fec144a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|38070700021|921020|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 dicHY/9wLM+qqVl7qlSBX3q5Oo/DflAXb91dDeTYUIJv2VlqAsUyT60S43GGLNt7GTxgDj7ieiYNE6mS+fGRGynsZOK7KIXxc78FC/N+7G5ucWeo4qDZP/ScVqysQxEHim4YpFMNuOjPafbe2OVRHIt4XHHhNuuFQtqOlYOHNeSBdW2qLbXZf3FmLwdZXtwRSf9sWSFTE4Q4uV1SCWnEehx799xvHD3HIx0fQL8AuVvVMinXZM5lnUo0Nh69BUE+BF0Z5LGHbqRvnf9zZX5alpdCdJqiPYIo3DI4urT1OCt7vfPOps+hndJyhcrvU2eZvb+OUwWw5AofylnE54GBD4ETe/EM6EUy/rrVzMZ+elZZHEa+CQlSor73Nac1FCXw85x9xJLN2b0cR2A3ZepIwiUB+GBohB5SX9i7BEFSus5mg5Ztyj4iqqwmGRO5sl1ZfN128cT84AZ6glhZLPbjZLxcvEJBVNUV1vI/SYOxgD5SRuxJitumtyGmpHCV/Q3ZJOhmFcmYUB8fakVbODEq9alh5FPwrLQHUTliXQu5peqYSPwBMDrpFMs55RyIyVCQYeGJyRA6eLjP+XbRZYcIz5q16fBCQHTkOG+F6mg/t96/+zJ0S5gIgtvSkfD/L5BrJVZpQb4IeB6Kr8LeTU0fuu2MuSjs/qYz3ikDNhx7h4yX05Pae3R4AJgpFixf8EDAMtI9f/9N1RbrZC3cfGGm/Iq6oqEvTale+G833DqFjyrbdrmlpz/aYxVhG46Kk9n3
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(38070700021)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-2?Q?n6ckqS7e+ZKurAbovmsWkW6Mn2A7i4EYAsT+XO7GIetUJtkECG9ZMJN/Ht?=
 =?iso-8859-2?Q?AVTD4cI+8CtkigXVKV7yA+IV4AIh9l38SHuVvCAUISAIdRpIZ/QmmALa8D?=
 =?iso-8859-2?Q?9cuIING0N8ED08d+2Et7SVBpUIRnoGXzV7oixTkBSu3jNiAPLZ+TP0HK/+?=
 =?iso-8859-2?Q?9bwgQo4Bku7ZR6DWhqrVIsl7EtH3q2/dv6SiOrODAug4y9HsqLqfx9SRhS?=
 =?iso-8859-2?Q?Ce9+Dre01qXwrQA/flZfAgfEM6LEP0SQrvKq0OYYVTg7kGcqV5goXv5rA2?=
 =?iso-8859-2?Q?QhcIv7HkbYFfUtwN0kJhe7bzuw6JHNIl+Ltf1wDcbtf2OKQm3hBhiJPUzc?=
 =?iso-8859-2?Q?Xx1JYY16ivA1gOGH88ez9B6XgkBbxn5Lu5kWZG1XUmFXUIXezpE0hwj4Vm?=
 =?iso-8859-2?Q?+1LX8JfO8431v4FExfxHF6X9+zBxYZe4lI6QA0JNLW4Ig6nT4ucwSVg6wf?=
 =?iso-8859-2?Q?RwMrIIIAlP5/RfX+oN5L0zYBxRhxILWOvF+jhz71YMcJq6vZKB8L+ao/3z?=
 =?iso-8859-2?Q?GkoH9ldkdT3IbV4flowfsSzkbDQZ/eKYh8+MBtavt7VAybQCR2lgD7/WeY?=
 =?iso-8859-2?Q?B/YDElxuLEWOKJVlsSklXM6fHsQ/Z4mLkDjZ2OyvomLsQytJkclyp0GTPk?=
 =?iso-8859-2?Q?Q4GXKeV0Z8Li53eaz5EApXTWSBQgWJ+wN7qTF4phiaYdLrhWMunUYSalJ2?=
 =?iso-8859-2?Q?xl1y6gjgszW6tcDq/bRaQscL748NJ8FuyuDlJFShPyc+ZCOJOJ+1sJ2DbC?=
 =?iso-8859-2?Q?NFXW8XWrvcPzjqZqVjEkodkAsY49hwWlgA98Tlv1oRmycFkp0Nkd0i/8y5?=
 =?iso-8859-2?Q?9V1xOF+EQ3CLqF7Z1ADE34kbcvej7+TXrsHCvv7f3W7bhn8+3TV8ztUXj3?=
 =?iso-8859-2?Q?8b1a8WG1awiGQP0QAWLAFrxnpDbYtlN4DNL3DmSvVwwyVeAQX0EpWyBYiS?=
 =?iso-8859-2?Q?1gsAU3/fXCJM/hEehFMGcq1jAzgA+gTeuFFLh17liaMr8ew0ZstA3WGT88?=
 =?iso-8859-2?Q?5nXXKkMesTkBIKvhfV/QBBtq6pHCzJVhQIPjLUDxrFozylKGZCY6nJdNDY?=
 =?iso-8859-2?Q?RlmsXHJBnUuNIU0MuRmhQBCJ5KS9SUrQK8PcqRV7n+34a+BiuhsUQPS8LH?=
 =?iso-8859-2?Q?MhPLcIwANEMYsceRqv6MrMOo9nuWIFbiF/wsRuFLhNw2LKsvJYBhsZXHJd?=
 =?iso-8859-2?Q?5LH21nYDQARjVn8vdUY+LRudby67xO/qgdsdSd6CSgJ5IGBSMotN7hUX8n?=
 =?iso-8859-2?Q?dbNzPeANTzeb8mJfreuAoVrA/aSuuVYAH8PSrNVNL9DdycK/+Od0PRxRqS?=
 =?iso-8859-2?Q?hEPjTBiYA96z3gq9awHqt5Ok4U28YTBv1n+iJwEoNSIxCJTkhRVdUpPs5F?=
 =?iso-8859-2?Q?Rasoy2cQ/Gd6gh6SKvHOVm9mYN5vVG+B9W2envnLreXcD4YH8C5jmTA1Rm?=
 =?iso-8859-2?Q?tWvDIaaodKxcAR1TD60wAymlqCju0C2hnBfzED5k/WS5SBdLOVWYcf8y1w?=
 =?iso-8859-2?Q?WzAOQh3TEzyxq+QyVflkj3YHFHn4SMai3iS0cDTwE2kXSfRHRk7XzZORxB?=
 =?iso-8859-2?Q?J9mq6rUlwfopWHgJ0ccu/zmIrR24f01fWmTiY/hp9o+SaGRd1fJ8v0gi4h?=
 =?iso-8859-2?Q?8PsZVdTEWtBXhLqte9E9fqKspAamjZSLsW32m1Tgh2JLnxd+sJLEBTB4Tj?=
 =?iso-8859-2?Q?d5aOQotK6AP/NTESSdCg3mrow0EEO4hl5uDZuBF4x/pGfqAa9DG/2CtPcD?=
 =?iso-8859-2?Q?aT6S9tSc4rwOA0S/nm9AjBssVdhgg1zCWHUEv9j5pIKQR4?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1a0c84e-dd8b-44a3-0301-08de7fec144a
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2026 04:01:46.1998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wePVQofRGfzUPqG9uOocbBrd+JXqul0LgOCZJUpDy5KZZf5RM7lIs6ynz7ME34hvDBQoaLp3PPlz8NtqnAgatg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29259-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[41];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,google.com,gmail.com,kernel.org,samsung.com,nxp.com,pengutronix.de,Amlogic.com,linaro.org,baylibre.com,googlemail.com,sifive.com,maxlinear.com,renesas.com,glider.be,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sherry.sun@nxp.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:dkim,VI0PR04MB12114.eurprd04.prod.outlook.com:mid,n:email]
X-Rspamd-Queue-Id: CA0C926CEC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> Subject: [PATCH v2 0/2] PCI: dwc: Add multi-port controller support
>
> This series adds support for multi-port PCIe controllers in the DesignWar=
e driver.
> Currently, the driver only supports a single Root Port with controller-le=
vel
> properties, which doesn't work for multi-port controllers where each port=
 may
> have different configurations.
>
> This series introduces a per-port structure and parsing API that allows e=
ach Root
> Port to be configured independently via pcie@N child nodes in device tree=
, while
> maintaining backward compatibility with existing single-port bindings.

Hi  Sumit,

Glad to see you've also added multi-root port support. A quick check shows =
this patch set seems somewhat similar to my recent patch set:
https://lore.kernel.org/all/20260310015426.365675-3-sherry.sun@nxp.com/
My patch set defines struct pci_host_port to hold common Root Port properti=
es (currently only reset GPIO descriptor) and adds the pci_host_common_pars=
e_ports() function to parse Root Port nodes from device tree.

The main difference is that I added the list of "ports" to struct pci_host_=
bridge for better maintain parsed Root Port information, while you added it=
 to the DWC layer structure struct dw_pcie_rp.
Actually multi-porting isn't a DWC controller-specific feature and therefor=
e should be added to the generic layer. Please correct me if I'm wrong.

Best Regards
Sherry

>
> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
> ---
> Changes in v2:
> - Fix error code preservation in dw_pcie_resume_noirq() to return actual
>   error from dw_pcie_wait_for_link() instead of hardcoded -ETIMEDOUT (Man=
i).
> - Initialize ret variable to -ENOENT in dw_pcie_parse_root_ports() (Mani)=
.
> - dw_pcie_host_init(): Remove -ENOENT error skipping to make parsing
>   failures fatal for now, add TODO comment about making properties
>   optional later (Mani).
> - Link to v1:
> https://lore.kernel/
> .org%2Fr%2F20260105-dt-parser-v1-0-
> b11c63cb5e2c%40oss.qualcomm.com&data=3D05%7C02%7Csherry.sun%40nxp.co
> m%7C136fbdfd37184ddb530b08de7a7f5e19%7C686ea1d3bc2b4c6fa92cd99c5c
> 301635%7C0%7C0%7C639082884622870739%7CUnknown%7CTWFpbGZsb3d8e
> yJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT
> WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DwE1pMUEgAKP9W7vqgSf
> q7AprdJW2tJfnJ0rppFMtOIk%3D&reserved=3D0
>
> ---
> Sumit Kumar (2):
>       PCI: API changes for multi-port controller support
>       PCI: dwc: Add multi-port controller support
>
>  drivers/pci/controller/dwc/pci-exynos.c           |   4 +-
>  drivers/pci/controller/dwc/pci-imx6.c             |  15 +-
>  drivers/pci/controller/dwc/pci-meson.c            |   1 -
>  drivers/pci/controller/dwc/pcie-designware-host.c | 175 ++++++++++++++++=
++-
> ---
>  drivers/pci/controller/dwc/pcie-designware.c      |  32 ++--
>  drivers/pci/controller/dwc/pcie-designware.h      |  17 ++-
>  drivers/pci/controller/dwc/pcie-fu740.c           |   6 +-
>  drivers/pci/controller/dwc/pcie-intel-gw.c        |  13 +-
>  drivers/pci/controller/dwc/pcie-qcom-common.c     |   5 +-
>  drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
>  drivers/pci/controller/dwc/pcie-qcom.c            |   4 +-
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  13 +-
>  drivers/pci/controller/dwc/pcie-spear13xx.c       |   5 +-
>  drivers/pci/controller/dwc/pcie-tegra194.c        |   4 +-
>  drivers/pci/of.c                                  |   6 +-
>  drivers/pci/pci.h                                 |   2 +
>  16 files changed, 232 insertions(+), 74 deletions(-)
> ---
> base-commit: 097a6c336d0080725c626fda118ecfec448acd0f
> change-id: 20251010-dt-parser-98b50ce18fc1
>
> Best regards,
> --
> Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>


