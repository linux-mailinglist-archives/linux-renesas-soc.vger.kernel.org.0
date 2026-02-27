Return-Path: <linux-renesas-soc+bounces-28576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJA2JS29oWmswAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28576-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:50:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE531BA464
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 16:50:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B10B30087E8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C0B543DA40;
	Fri, 27 Feb 2026 15:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="DO/lN8+e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34A03233E8;
	Fri, 27 Feb 2026 15:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772207023; cv=fail; b=qf5gRoP35l8CmJPWAkR3iwkkpOnRZcmdcmkfuE3Jmz+J9Z/ANkF/49wAGd45cGVds6Nb48KkhqC2ndbt/GHQpx6H3uj/orF8ulfLGDv/B0+5N1WBD+SO+4OiLxuviZma7P7G+lOCTH2re0jFUS8ALfFjs9eti8Dd8DgUHvrf+Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772207023; c=relaxed/simple;
	bh=0TGb48+gdyHzYkgv6oT5HcUrP+6HwfvrvSn4HMoLV8M=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hQWsne3XIJbnwlppFkMY8W+GSM6NHlY5RN1dHQyGESJwRpbHeF7jiYT84P48iZUmxI2RxXtVSbtzu3mVAoGR1BnQI+3PuWjKdptFyQ3oAxFJy1JTpv8vg0sXQDc3c09erojrsLGq1JfNKAjdRolPQVdQltyTdhjJ5S6PHBX4Zjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=DO/lN8+e; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lm7Gh6evHYBHsUvWYNGA6y2oHM9DSUsMyDRfX9gWGXUzXAQXdHKq+lV0/jZu2w3dRl5DCXEccpXSnQaDYu7VqWFK0Z8jffzhOmD2V55ME1APAN5RT9w30Jb5OzjdYF2voSvAxSP5nNBkT1xik0AfQMzc7gbrNEius/C6RfYQTI7u26nalnmTl8ROXr4SAksik3hiawOqJ/tPpwIr6bjmTWboy+p27ZCVFGH7/rWxa5IlTBPGMkeTcQus1fFqdSC1Cbf89/t9tcTWsSKt/w5ZnY1fbHY21knhcPOc+KJiSjdLy3/DD4arC/oze4pmRLBhcRQaYy2rJ54eZXX/YVVwUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UpqlCZaxdez6gK/3/szsHrpLjqM17r/zVWfM/NS6ww=;
 b=zHoMVdZEo/04wFi8pCF+FQkS7pnyRnCHOuu5ctK1VB51uF7QLwjRNVP82+fOc4mI/h91sgC1fa+GlA8CyJL3YnIPzKw6ikaTzxBJt6tj4z8Ngw2oPRceJLVwUemPLa+XihwBZ2ycC91c1H3c4ggEVO3gOK82XXDNROX9sXKARPmK1nQ1rrqatiuyuM+R2f8AdkEW8E5yNcMJxEudvHj5E7ic0uHb95wxPg88vPWz3qIsmMbrBh22rtkQ+9OPeNV+yLk3WPIuO5wUqU1ll55fkQgw4V49zQsds9r5reXhbW9srQu7JDo6ZZZa/BsZ0XuXigqmS3O+VgvXMn89TS4KUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5UpqlCZaxdez6gK/3/szsHrpLjqM17r/zVWfM/NS6ww=;
 b=DO/lN8+eo1ByPF7s0WX4O9VaZ2fLaN73eaaprvDc2HDLIBWZPsWKuiujUrN3ULqnAGBY+MPQ03co8MTSCjjOYCqXYn8JcnkFhUch5z5Pq9oxpFggnN8USgd0bMQv60j37U1wR/DFd/hfKe5RToK7+CkiL+e/7DOdGbFqdKarRhY=
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com (2603:1096:405:35b::6)
 by OS7PR01MB15042.jpnprd01.prod.outlook.com (2603:1096:604:38c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 15:43:39 +0000
Received: from TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3]) by TY6PR01MB17377.jpnprd01.prod.outlook.com
 ([fe80::f373:26d6:86c4:6aa3%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:43:39 +0000
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>
CC: "robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com"
	<bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Topic: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
 controller
Thread-Index: AQHcp/6MRVhKQ7pRGE+/nFmphIYso7WWryeAgAAAS8A=
Date: Fri, 27 Feb 2026 15:43:38 +0000
Message-ID:
 <TY6PR01MB173776608DDA83CD05D26FEA5FF73A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
References: <20260227153236.55988-1-john.madieu.xa@bp.renesas.com>
 <20260227153236.55988-13-john.madieu.xa@bp.renesas.com>
 <TY3PR01MB11346B9FB9B0FE7BA3B82D6378673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346B9FB9B0FE7BA3B82D6378673A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY6PR01MB17377:EE_|OS7PR01MB15042:EE_
x-ms-office365-filtering-correlation-id: 9919fab5-64c6-45f3-cc96-08de7616fa13
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|1800799024|376014|7053199007|38070700021;
x-microsoft-antispam-message-info:
 CY//wTLek05v094YrMwVUrZqaCqCxsqXwWBTBBvrBM2q5LKpD47AF6z9PrgBfTK+CC89t3X7PW482OyQV9PwoojEmfGniRe/FQY3X3qdP5p0nNjxRDuEfveD1C+ckkKbaOfgQy88n6lzBOmZseXqnBuAgGa2JltsxtqdxTdvPVBnDVka+8Po+zLrsmvUhGtEicPI91TDkpEWdSLUFxFRInOdkys8HlsKBeAYVJhnH/MbmFsWz0FDoCxtX4JuuWbaVETBp8PT4hj6yGGxsA5sctrVOlVbGKBCQ4ovab2CwSx3diIj2/UTaGadgNt1nlmLhaWBKm7ba8+CejOFnvOQjo4GvqdVEpZb1mW/CnkNJ9PN2sQE5KRdaKhsBfgcBH+QUB3zl1ZzviUcAEcL4wIcwlT9ao63seTnfq/77SCKDxnsVYkrZYPscBJhaXR14krC7Emi2XBHzRvKj32OmD26OSvBnKYpZ+iECgu1bk8I/VDR1jX4KyeSXhYjER2ZmElOoUuNPh2bAbTn7z9UMhWAtJPL3vTJYUD6Ln5zBHE94fzgf8r6Gk/XKRvpVtQQBSORL013yPGH3yocomXcFD5sE6mjKqSNZT0uqwmBdT9aEUUtwNVtS+Bwnh1Yg4Hi1x+njv/9sKiP2VnUbXVzBXZ9AyP+aaCqmP2l07EGtDu+JmUc6rDhjEByHqjX+eGsQROqW9Sa6G8RrVhpXH1jRAn27QlgrBVR95VE1IYakcG8v+yhOwktz+yxWlH2Stm8CCiNsEl+1dRvxJt2lgXt+0+0Qf2xCLgnUE5Sv/zg1ObF9Fs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY6PR01MB17377.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(7053199007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?1cDGpY43/sao2lAckWM+U+4SNt9Ci8Md/sMz5uaMEY/pMicrRqBkougWSgAv?=
 =?us-ascii?Q?FbUkoKW3t4ukwswGDUSD+T6EH2MB016rljiMcUZ5B+z0qEL6oZqTafGp6wtw?=
 =?us-ascii?Q?iWZ7N1KqPhjPYAyMzz/zZ0U4OWJQ5EomH4vesSN5LVqjPdJla5oZXNniQwQp?=
 =?us-ascii?Q?FSJ5FvwsbmuE6o4lfa62WXu4TuTi2bQ38pizryCrxCWNKhrfl3u9AjEAG/5f?=
 =?us-ascii?Q?K4oa8XY9wZxkXALqv5Il03M2CYkVcz0ZazzxuNHngb5oPU1Vr1EQ17zbfojq?=
 =?us-ascii?Q?P6R+wUQIedwjLqv/oWqx6qmIu37mNGZnG4Pp0D20wp8CjIhQE6R8YrSF/vts?=
 =?us-ascii?Q?22PDa5ycgm3yaMmGV+AJNUy6fTBGTEfUFZfI9QHXqUxDjUj1Qw1TMcOkoJfM?=
 =?us-ascii?Q?WqBEnIn3/dOdNbmfS78cYaUylnzC7z81u7bo5hoqbEeyJJd4h9IeCbXG/ypw?=
 =?us-ascii?Q?yuLyOgcwdiwrMStw8nEIJIIEIqquI3yTXnrLQvBL0j/I71liXYhkwyxZE7yt?=
 =?us-ascii?Q?XOptVWr6K8vpJAg5iZ+J8IyJ7FoUN2he2Lh4rZIYC6kDEzbt+bVlfapSDaft?=
 =?us-ascii?Q?irpmCXoKR7xSu010AhAgJBlV/MoS8TTcerNHf3teRqoVaOlukBNXiPWTxkld?=
 =?us-ascii?Q?YlDTwtR7QQPZxVFo5GFrRi5kxV1GEKm2M5BABIO2tdwG7piJru8xQ5cmECN1?=
 =?us-ascii?Q?f5MYw1toRg1Ugwbh4vSfiy/F9pCr6nrJSIQGED0WMVaBQJ4kr1japyxdrCUW?=
 =?us-ascii?Q?/TWcpKgpyGQzUhAmZvztZKE+ZQhcIpPIIsQIsuSOowkmmDMwg4rnS96HzwL/?=
 =?us-ascii?Q?gzfGVE+Yw8EIhUTex8kde6M9NhWjJKuwAy4cD1Wg4uOVyqZbwzX3580/IX8x?=
 =?us-ascii?Q?4LFdbatlbmihLixhKtUwcRvgiDQD9GitZ3gOWBVHJg/fHfaq0vk+ZXdM/PCf?=
 =?us-ascii?Q?Qm62Pn/oHMSrucRzTX9V1YFPQaVeBYxonSPBb+s57/09cR7irekb2qbEUA+N?=
 =?us-ascii?Q?5E18S7i/d0lh/1i09iVoEOgrOuIsqG1I7lkc4ut3cKJ4sjnQVE+Ke/anOSoD?=
 =?us-ascii?Q?q/qs7ZMyrgPjEIASqRg/K4+UuKWRi77hKNmKzJ384fRL3Dl52bnvUhlNgRvA?=
 =?us-ascii?Q?DJBF2h9cvlUlF2gwfoqLZL9NArb/YmE4rV1bEQoe9gRR/4ggYJ2WHgntOe9l?=
 =?us-ascii?Q?UYAVQipw6SPbNDWKz9LlBOvYzwNTRwkS5e0QeNSbV19QNG/KnDMXADfET8mN?=
 =?us-ascii?Q?igm7BalZiIiekrBNUJkwDhC/EkHVECCRv4mV18jP9wZHsL8qGeU6AvKhu4TF?=
 =?us-ascii?Q?ILNqarMIpsSuhIZR6xfwFEw0Y3sX46i+FOF446dL7p5+jSuFlVB+jM1wIP9M?=
 =?us-ascii?Q?UQoR0BvbBrG2Log/Z/XzgHvOmDrvI7fUqxAy601u05PBDnixA6WV4Fhz1dQi?=
 =?us-ascii?Q?JghNlTHDajQ6u1S8SriOA7JtVsM1DA65ensLr72p/TBQoBq0ePULN3tywau/?=
 =?us-ascii?Q?PYwUqL4qLRRRc/m88JBSd8JU8T2TvhCRq8E9PyvfG5Ozg2ltmBRXHTMX6ONF?=
 =?us-ascii?Q?scbc+FpgD+LoBys4RQvYVEpgNVrERIZszp83L/MNaNUAtB/zcJjJ2psV0trW?=
 =?us-ascii?Q?vPDg4tWSTQXu/eUL45zSZisqNlGkxxOvf0txd9m/s4b9ApYauNj5MQWFCeQQ?=
 =?us-ascii?Q?XP9ctGvyy/IOPzrZWVAp+YXa5f55Ljs+QvOv6XMdpJUdzdYH6rni0f6p1LFf?=
 =?us-ascii?Q?Rv4tr5VnO+12H7qzbe3SMh9JF9XF2G8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY6PR01MB17377.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9919fab5-64c6-45f3-cc96-08de7616fa13
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 15:43:38.9619
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g34zOmD2SlRz7z38Z/h0xyqdixlP+kRk1e9qcWlfaemnnquz8DG7gDND0LpKgsLnRyBaI8E/JwbdyqIrEDptwibwcNxT6xDsM9XjKDNMuow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB15042
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28576-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[john.madieu.xa@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,renesas.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 3DE531BA464
X-Rspamd-Action: no action

Hi Biju,

Thanks for the feedback.

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Friday, February 27, 2026 4:42 PM
> To: John Madieu <john.madieu.xa@bp.renesas.com>; Claudiu Beznea
> <claudiu.beznea.uj@bp.renesas.com>; lpieralisi@kernel.org;
> kwilczynski@kernel.org; mani@kernel.org; geert+renesas@glider.be;
> krzk+dt@kernel.org
> Cc: robh@kernel.org; bhelgaas@google.com; conor+dt@kernel.org;
> magnus.damm <magnus.damm@gmail.com>; linux-pci@vger.kernel.org; linux-
> renesas-soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> clk@vger.kernel.org; john.madieu@gmail.com; John Madieu
> <john.madieu.xa@bp.renesas.com>
> Subject: RE: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E
> PCIe controller
>=20
> Hi John,
>=20
> > -----Original Message-----
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > Sent: 27 February 2026 15:33
> > Subject: [PATCH v7 12/15] PCI: rzg3s-host: Add support for RZ/G3E PCIe
> > controller
> >
> > Add support for the PCIe controller found in RZ/G3E SoCs to the
> > existing RZ/G3S PCIe host driver. The RZ/G3E PCIe controller is
> similar to the RZ/G3S's, with the following key differences:
> >
> >  - Supports PCIe Gen3 (8.0 GT/s) link speeds alongside Gen2 (5.0 GT/s)
> >  - Uses a different reset control mechanism via AXI registers instead
> >    of the Linux reset framework
> >  - Requires specific SYSC configuration for link state control and
> >    Root Complex mode selection
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > ---
> >
> > Changes:
> >
> > v7:
> >  - Renamed RZG3E_PCI_RESET* defines to RZG3S_PCI_RESET* as these
> >    registers are shared with upcoming SoCs (RZ/V2H, RZ/T2N, RZ/N2H),
> >    dropped associated "RZ/G3E specific registers" comment
> >  - Dropped "RZ/G3E SoC-specific config implementations" comment
> >  - Unified function naming to rzg3e_pcie_config_{pre_init,post_init,
> >    deinit}() and rzg3s_pcie_config_{post_init,deinit}()
> >  - Simplified comments as per Claudiu's suggestions
> >  - Used local mask variables for compactness within 80-char limit
> >  - Fixed L1_ALLOW error path: goto config_deinit_and_refclk since
> >    port refclk is already enabled
> >  - Fixed resume: reordered MODE before RST_RSM_B to match probe
> >    sequence, fixing error path handling
> >
> > v6:
> >   - Use rzg3s_sysc_config_func() with per-function calls instead of
> >     rzg3s_sysc_config() with -1 skip pattern, as suggested by Claudiu
> >   - Extend enum rzg3s_sysc_func_id with L1_ALLOW and MODE entries
> >   - Use regmap_update_bits() consistently for all SYSC accesses
> >   - Shorten comment to "Put controller in RC mode and de-assert
> RST_RSM_B."
> >   - Drop "Enable ASPM L1 transition" comment (function ID is
> > self-documenting)
> >
> > v5:
> >   - Introduce rzg3s_sysc_config() helper for sys configuration
> >
> > v4: No changes
> > v3: No changes
> >
> >  drivers/pci/controller/pcie-rzg3s-host.c | 90
> > ++++++++++++++++++++++++
> >  1 file changed, 90 insertions(+)
> >
> > diff --git a/drivers/pci/controller/pcie-rzg3s-host.c
> > b/drivers/pci/controller/pcie-rzg3s-host.c
> > index 44ce056d62c6..b7f92f5aee4a 100644
> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -111,6 +111,15 @@
> >  #define RZG3S_PCI_PERM_CFG_HWINIT_EN		BIT(2)
> >  #define RZG3S_PCI_PERM_PIPE_PHY_REG_EN		BIT(1)
> >
> > +#define RZG3S_PCI_RESET				0x310
>=20
> If there is any new version of the series, please put a comment
>=20
> +#define RZG3S_PCI_RESET				0x310 # Only for RZ/G3E
>=20

Noted for v8, if any.

Regards,
John

> Cheers,
> Biju

