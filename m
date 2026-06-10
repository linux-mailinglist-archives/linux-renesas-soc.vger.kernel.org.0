Return-Path: <linux-renesas-soc+bounces-33801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xe5GC7YdKWrCQwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:17:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C85CD6670E9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 10:17:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=EA8fuOjZ;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61539305634C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 08:14:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BB203A380E;
	Wed, 10 Jun 2026 08:14:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0239FCBC;
	Wed, 10 Jun 2026 08:14:06 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079248; cv=fail; b=QQdT6TQTKKscpKjb4CVfcAypScQBgDYaTYFCNhSL6qJbfjLra9J5Q6Lz+qwe5geIlScr4DVcwpHQd0v3bc8QsO8rNUrYTbvHy003MddrJUfFr1uQL/mQjtkeRNl5SI6q4WTQxJNjRF9T5yaX7oFZPcthjm4jGhUBWJPsRUC9pAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079248; c=relaxed/simple;
	bh=kPFL6oLH38nBCHUTgtHCLGkmHUb1bE/txSORGMm9ub0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=idjrVshemFAUBMrTTZ/QERd/xQV4gt4j+BerE4QKwllhkxNkxppHfp8avvCVXLC+yaAHueSYMXO1kOOYMsBuDnOvsoq90TpBTnlzPl/0KwIo8tlVRSEKqspUhBevh3U0pLLs6JUkh2PLxWPd/2VAXZo8SKQ7JBqf25PSh5KdkGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=EA8fuOjZ; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvWwcxw2up84X2uNN9nAfDJQ5aOEkzD62d+9bKN9y0FHtoVYHrw7efGreqS6FoOeqAITkWgo3Mftd2nS2d+l+oeZWuKcouncybYlzrMlSmly0/vzKC8iTmNyvdA8x+IO3TJ2XE6QOCg/30Txmq7uW1S/ZR/E85dZTXcGACwmFf+X/iaDbiKEi+HLbyJLJUB6qFHwbCrVBPyDXqhFq1PxUPJJ/eB6cOqUw+BUimd9LFTC5cWgJ1kVAtf1ZoBkP7TtX9zcWW+xuR3gL9/XI8O73c9H9Z3Qw4J7D7hF1CO9q58Fvc27gCms7tg9Xybn0Pu55l4/4zIjIxxagA+VYUkCZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYfvd6Mcfzw5fm9Z8KuLACKyF2FG7r9WBdeUMWmyJ4c=;
 b=WV53VbdBFp9Ugk+JZJw6YpMXBBs/vDPg3IxFq/SSJ8olZrSmCHU3/U4c0JkvLFC9Dg/PCYX4EvQrY4+DOh3ODJbZeSLlvEoHAUKz3dMBGRF48cn0sQcOoR/KTgmgLwv+NgVl/aiKpcXJ9RBDhwHw/chjCa/KRGKO9zf5T30kBfl5cfxKKvOM4HXB95FopvQ4I7GCby3XorB0MC3VdbO1br4qR0J9mwJu5wSrj/85CmmOMpbiRpYK4TThb0uBajNcAA0ded/GI2vx/xJoWZm91F6J7YP3Va35NWwN7KGhXgx+ScYuOAWEiMzmk9VoGlAjwGlRTuGsArXW9Ql4YV9JYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DYfvd6Mcfzw5fm9Z8KuLACKyF2FG7r9WBdeUMWmyJ4c=;
 b=EA8fuOjZqrL8MKtvpuUlqSKpF/ZfM5RkkT+24HH+oiePx/eYKTQ/W9ll5rgssLF8wr0zaVWhurUmHoUMI8DmxfHE9/ZYQ/ELazBBLHAfj6Dkn/kFNQ0QGcg7fXwefT9lxpsrhvYzLeT5LHeWN0RzHsNC5UjHVHRe9O+4lR4oA0E=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY4PR01MB15412.jpnprd01.prod.outlook.com (2603:1096:405:273::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 08:14:03 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 08:13:57 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"john.madieu@gmail.com" <john.madieu@gmail.com>
Subject: RE: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
Thread-Topic: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3
 clock generator
Thread-Index: AQHc+K1prHVSYjuVQ0C9HGlf7UjJ7rY3b/pQ
Date: Wed, 10 Jun 2026 08:13:57 +0000
Message-ID:
 <TY3PR01MB113467A63C78C21DDA14220BE861A2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260610074702.1743334-1-john.madieu.xa@bp.renesas.com>
 <20260610074702.1743334-3-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260610074702.1743334-3-john.madieu.xa@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY4PR01MB15412:EE_
x-ms-office365-filtering-correlation-id: 9366547a-a69d-4ea7-840c-08dec6c8383f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|5023799004|4143699003|22082099003|18002099003|56012099006|3023799007|38070700021;
x-microsoft-antispam-message-info:
 0sESYBPu/jLuGNZczjec9jAkbMnsfW4of4wUG3sZ8dmGRqn7zPoj0GqgGOivfpY4KAerl21MIpCGPlYPuAT9TPu4JZfjjE3rREd45bwxBjWbr2Wmz0U6WX6laPmpIh5hSG4Ojk0qeSjOQM3HAiJlfaQoHf5jme26nBR1XzP9P1oJrmy5ToGtlBqX7+yk/PONF+ZK6PrJ7X4zsRcx2HmBZkrAFlgjPML+nyT9gVIvKe+AGgKQpeED4QzRf0w84IgpZDrNhpgDp0LNfcvdIY1/R5mwuxMyCtVigbZJzGX95fklR1ZqK8+ZNU3AUaJNeFG+ziN67zMEaBaD2hBzqHlDg8Yq78w0GGYlwPq0Xuj8QiK4jJHauDAO/LzcFGMeDuzTtxQqyTzJwtvg7IQZAgE/E8ejSmgAkRdpzjbXZChmK9Bzmdg7/d5ypBfdgs8LQt9oHEjpme48J7eA0ElZJv+Y6V89N8cL1SsYitTLMGxu48eDQ/qmmXd9AMOYx2o5fSW0ODaD/wXtZSUfCMZIboK5s6VUa4vnbKcpXqPw1eqHenuyFFlE2xi4B7nuZ1OyLg0HWgVGdk1z1mK5GtJWpxhuRoYIYrdhAoTtLyYDKbwVsltElcCql5XSTsmygHFefV+RF+73WONr2N+NcTU+fGuSvjhU2bFv1nX0JMSDu9S1wioqsIL0i0qfiqbETQcIawZ+M4A2ejQMeWNDBxVLKBlBOen4uF/hkcWhvs3+q9VkbaVPVw9l3oTPpmOBX2VkIP10
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(5023799004)(4143699003)(22082099003)(18002099003)(56012099006)(3023799007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?pE3ilSUhT/fLJ3BQ1zg80q3AtKQH/c9pZVuoFkrJOBoy6QtSM0J2bPJFmrCj?=
 =?us-ascii?Q?5iryzJXV0p23KRI71syvB/NX8bGxoQt9xXlZpPLK9S9L5c4gh2J5SkrXaPW2?=
 =?us-ascii?Q?oKVzCNrSZtt172A6j52F+Qx8f+Elk/+do1+CumIj1gEJ4qrVgN4QftL0ZfEa?=
 =?us-ascii?Q?zAjDMsi83XcjB8zmIsxRzW12M3Dx7bdSZr6/VPyVTpndYAoFVD+UkXtQAUnz?=
 =?us-ascii?Q?w5o5K/+R9xQ0cff8UM46IzsFmYRThsxUEKSTld1/CPtVFcil6sSTBVnfNNoA?=
 =?us-ascii?Q?5Vj30ApIW59FYnfRHkb8pXc2I/qCmaGPaYiPp3KG74X9C8bMIcP6pyxy4mGr?=
 =?us-ascii?Q?9KU3SljCtOlsBYs8Zvd94q5Y8dQIbJ9S9Kpm0Ma44Q5JErhbIKpR9mClgamS?=
 =?us-ascii?Q?QRRLf3/jONnGvfWr49zVa/YsVYQt5mfp/C2qcozHzBpUK1LC6no+7WvJgH7m?=
 =?us-ascii?Q?CgE+Fb12XYqT+QPg/xwbLDYaNF76iOA+r9BiqbY+FTSldLb4//DVqeBJWZ9a?=
 =?us-ascii?Q?brRN4PKAQxAgH0ExTe0Jg0xR6+kfBRXAbjHg1LozPz42RuLT6SxwZnlDhHsK?=
 =?us-ascii?Q?yKzEkmLfLwFW7I1/aRf0seoyT7smIGV81TofCFH3SNimWeVcuQBim6S8CM7r?=
 =?us-ascii?Q?Lr35BtI7r5yiXSgH/7z2aMs5E0iYmIaanLm0+H7v2BRhsyA88TaXKg/JAYLk?=
 =?us-ascii?Q?O1b9V7fw5+m/tnTbadQqQRCc+zBAPvxIevtcGb0f7/hXTC2C3ouN52u0k979?=
 =?us-ascii?Q?zaJNw/D3CvHVkJegNOaeD/a2pwdSRZhsbflbQfjUc5BLO3uHgHEuzOyq5kIG?=
 =?us-ascii?Q?+GbsNuVdI0Fk+QwKKftLuhZ/PsvMwI7t2ReBqHg5dCEh4ooJ6HeVfUMS9fxs?=
 =?us-ascii?Q?nd7Ay2HUpJAM83WvjSNE+pHM6dCPUllmC7eVjPb5HbKydq5accgLxwwOP4bT?=
 =?us-ascii?Q?F1xf5iPjkiYBcEWjGWP2PNyWh89FHB8LDyhOd07BuSSnWEQ3raDq//aj+4qz?=
 =?us-ascii?Q?+d9kmQTwNzbulSoeLd4XwDI04EcFxhqyMjSJBEtsBuVsMzijVNxhTGzYcrht?=
 =?us-ascii?Q?BR02R7Dh42kEOfm4rVHILr439z2KwlJ7B8oUQ8GbORQBKi1lw0rG99eBOnmc?=
 =?us-ascii?Q?gtyZT0w2uMj4INqtjGvBvmEdfwxoOy9Kr4HGAkYVs0oW8IHNWxCBOzc2b+Th?=
 =?us-ascii?Q?km03xr6iI444RFmqTotZZ/ee/7HosPUPa+FJDu21RYlOuhSopIu+n9simfFO?=
 =?us-ascii?Q?EGgFhK9fsx9GCmbnYUwtqhN7a3b4HFJwJuUdojRKirxk0fvZnNhCPrZJBBwL?=
 =?us-ascii?Q?1vnHysCaDvjlpVD3r0EzQnnGPB0r/3PqIB6kTDXlRylUh8ost7gxoJ9Rq+i+?=
 =?us-ascii?Q?VygkHxP+tFdtrJEG4q6pPfv9qyXMV6aLONqzLnxuVvMu69jGyoLBi3aPnA2X?=
 =?us-ascii?Q?XJkLZKi7MY28v52x6c9dIEXA2s5o4KZf4us4MI4pJarQ87Ap01LSOoIi+an6?=
 =?us-ascii?Q?thcPn9Z4ThUXoyD4ulmLBdYpVeBxJ8vGk1PsKolMZHEa3R3dRZjtsD3cLtIz?=
 =?us-ascii?Q?fdeu5oz/U2w4Y82Js/N3sAVlFWrX3w8Ih8N6XOw2c8JNKrnVtmZou/2s6B/7?=
 =?us-ascii?Q?IZGKFfopAAACT+eFtUGuTUapN0NS4VA7mX7xt0bq4XzP5KEiZ/AE5KacerGb?=
 =?us-ascii?Q?f6NigYLNUy2EU+cqexhVgE2TJFfLzmqGOEqvczT5S2FwawCqMfmTFawi14Cl?=
 =?us-ascii?Q?nhZyF0HCoA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9366547a-a69d-4ea7-840c-08dec6c8383f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2026 08:13:57.2452
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4l3t/FAT5yxujiCbkffXnuLcmDotJUlBHmQLvk19HMuVYsmfU1TAVWvgq/aXdL2du8K3eRapcXwi2gBp628z8N1/BSiZMuAnciNDb+5F60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15412
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33801-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[bp.renesas.com,glider.be,gmail.com,kernel.org];
	FORGED_RECIPIENTS(0.00)[m:john.madieu.xa@bp.renesas.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:john.madieu@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:johnmadieu@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,bp.renesas.com:dkim,bp.renesas.com:from_mime,renesas.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C85CD6670E9

Hi John,

> -----Original Message-----
> From: John Madieu <john.madieu.xa@bp.renesas.com>
> Sent: 10 June 2026 08:47
> Subject: [PATCH v5 2/4] arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 =
clock generator
>=20
> Add the Renesas 5P35023 (Versa3) programmable clock generator on the
> I2C2 bus along with its 24MHz input clock (x2 oscillator) to feed the aud=
io subsystem.
>=20
> The Versa3 provides the following clock outputs:
> - Output 0: 24MHz (reference)
> - Output 1: 12.288MHz (audio, 48kHz family)
> - Output 2: 11.2896MHz (audio, 44.1kHz family)
> - Output 3: 12.288MHz (audio)
> - Output 4: 25MHz (DIFF1, Ethernet)
>=20
> These clocks are required for the audio codec and the Ethernet controller=
 found on the RZ/G3E SMARC
> EVK.
>=20
> Output 5 (DIFF2) is left out, as it is not connected on this board.
>=20
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> ---
>=20
> Changes:
>=20
> v5:
>  - Drop Versa3 output 5 (DIFF2), as it is not connected.
>  - Document output 4 (DIFF1) in the commit message; it is needed for
>    Ethernet.
>=20
> v4: No changes
> v3: No changes
> v2: No changes
>=20
>  .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3e-
> smarc-som.dtsi
> index 15c22dbf0ad3..e951609d39e9 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -78,6 +78,12 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
>  		regulator-always-on;
>  	};
>=20
> +	x2: x2-clock {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +	};
> +
>  	/* 32.768kHz crystal */
>  	x3: x3-clock {
>  		compatible =3D "fixed-clock";
> @@ -137,6 +143,20 @@ raa215300: pmic@12 {
>=20
>  		interrupts-extended =3D <&pinctrl RZG3E_GPIO(S, 1) IRQ_TYPE_EDGE_FALLI=
NG>;
>  	};
> +
> +	versa3: clock-generator@68 {
> +		compatible =3D "renesas,5p35023";
> +		reg =3D <0x68>;
> +		#clock-cells =3D <1>;
> +		clocks =3D <&x2>;
> +
> +		assigned-clocks =3D <&versa3 0>, <&versa3 1>,
> +				  <&versa3 2>, <&versa3 3>,
> +				  <&versa3 4>, <&versa3 5>;

No need to assign clock rate for unconnected output. So drop <&versa3 5>;

> +		assigned-clock-rates =3D <24000000>, <12288000>,
> +				       <11289600>, <12288000>,
> +				       <25000000>, <25000000>;


Drop <25000000>;

> +	};
>  };
>=20
>  &i3c {
> --
> 2.25.1


