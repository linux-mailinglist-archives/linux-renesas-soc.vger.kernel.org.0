Return-Path: <linux-renesas-soc+bounces-30110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAh+OXlAwWmeRwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901292F2F19
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 14:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9A98A300DDFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Mar 2026 13:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BA93AB263;
	Mon, 23 Mar 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tpkNDot5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010058.outbound.protection.outlook.com [52.101.229.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743942D7DDB;
	Mon, 23 Mar 2026 13:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272249; cv=fail; b=NjkYi2eTXRsU/OY1rxtGIhunvo13QImM83IeQ2FgcrWeRNZJ1Nh5pQRKl3UHGpM15jg9jLWC9Q22JvFqfjTCGCBQgvX7HRmGy2/X7Dmz+P4A7LdMQxHpZoxmeA7zOFucmlyCo9rIWd0ocso+xpeGS5rM8FgHgdFPwYVuSJyztfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272249; c=relaxed/simple;
	bh=Mr2lFuvAuhZ7h6paxxIX2ZhpNgno9L4ZKwMDhEL7/hY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=hxae0jigcofjU/UwXfNlNeQDyoRUBrsaEDVIaBlP7gv94fH5lARqC/FgxSMfpmx5XU3sA3UpNyQRXw8t0o8EjpcZOb//vQdEAUBYaPlLtTJw3+Eg6r9w63n0e+Nbfwt9zBM8bzrA3mz4/qwGw7AHDhz8jnnUM0n4soy6KPb0X3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tpkNDot5; arc=fail smtp.client-ip=52.101.229.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyZPjTD/11xOs4ungy8qI6nhSK6Yj2mMo0baxZAMYFBU5h8sreYwvjHQPedzxfd3Fru6eVaxsqs822Hc3i90bJf7PUmXPgG9u8uSFXuaXkeZEfkBDF4TTj2Icd65D6NnQwyGQ0UoyjKzbZl0YW1hByaj6TnWp20zOAL5j3b3vt0CqMY64xT8ww3j1G+XG2md7ASwnWukKJ8XrUd1FppgScKikgXjgw8XWrBmFMjIeDsGhvzwom0fwn/DJWgO9y7inFr/9dLuGzoOJijdkK2Lm4MK2QyseeH+qAHMW1F+c+7V7FWvXaxtH8hvoP2oXo1ll2oXbRHDLb7iXV189TL1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a8xiPAsBsGBzi61wxVAEeQQ6Q/LtVAUVWO/IJ++G7fk=;
 b=k5SJpqkuOCw7py5dfLk9WQA1xLfcvNMFtmVj/T1p5vglWP+jNqDY4HQRnSP5HnoJ1ySWWc/4e0oiZvKMoe4SBuDue/etWW9UgdaiyC5nM2+ElfsFkjNPzToMHJVdatRt+C6qDDujmm6pPeoAwf9DiTrbfqKuZlCACT7BvkkcGXCx5y1+qki/0SujFiJeHfaNs21L0WKkAIb4nGqNFSed3y0YHJ2xXKbpP9Y4uVPJbfKvAgxVaxoWAGlyUlbE1bKNfpX7jq7omuSzRKWQOSLmYWQxGgVPg5hS20qwTmqVu6Os6T1pqpwhVlIVQTy4R1l+6yoPlypJCYBlh0jP4ESNBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a8xiPAsBsGBzi61wxVAEeQQ6Q/LtVAUVWO/IJ++G7fk=;
 b=tpkNDot5wsATERcreJsIxvC8nN8diA9FIkbdjzwfJeyPSwuKZ/ZqXOlZ+uzXAzslADn3KS1KRuueu1Y+aKR2MKUzn6meiPfQhErPOxD8wxGZvCCvtee/9roF3EM2LUsPm4JjyweihPyuaAM7iGcpqR5Tu8ua3M77xe2NxSdtdto=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSZPR01MB7100.jpnprd01.prod.outlook.com (2603:1096:604:11a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 13:23:28 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 13:23:43 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: biju.das.au <biju.das.au@gmail.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v7 01/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Topic: [PATCH v7 01/10] dt-bindings: clock: Document RZ/G3L SoC
Thread-Index: AQHcuFdLFpAC8aylHkKpsjrkcq2tHbW8H7+g
Date: Mon, 23 Mar 2026 13:23:43 +0000
Message-ID:
 <TY3PR01MB11346B7A8A0E31B9A231FCF7E864BA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260320104950.42220-1-biju.das.jz@bp.renesas.com>
 <20260320104950.42220-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260320104950.42220-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSZPR01MB7100:EE_
x-ms-office365-filtering-correlation-id: bab6398e-ea94-4121-f4f0-08de88df681f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700021|56012099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 UbY9iG73Sou+vXOTVJS53g05FQvgFa8Ye47DG/Pr0J8U4sbHUXhUfiMd0Zt0TnZ9pjbPu4H7SNuMg0kVWl/Y0YJpUvUkk2u+RaVtTGuw3KJLoPuFgkFvswYXaHhTAYig/No+gU6Eck03PVuPdungnhRIH81ri9E1xzjskHEsX+VV67CAPZ37zFA0rrZNxqLaymmlOCm0/SE8ka4jXwdD35PRwAeoK/E2ahkeUE3vbsURbSsrGNkyDYNjvxguzE54Mz7XYNorGV11FN0uS9o2Ci9TSZBy4LTrf2PzmFkumHh7PO0Z11AzrBYLiqWvA6zMvG1ujNISTLZp+EbrgNSxZ9ZzIyesuxwP+P9MMEy9dKgLx5yK/kUJaOs5Vj300xXDoCKH61AKqN49Tr2aZ9BSKXCVCQD/8/F9u/8wZcw9oAkCOdfRwWVJsHO9peA+ZITCpiXwpP2dmcPVP9Ch6avVlgbJ5mprO5cpkhUMhHQKc0sNVr3Ic4Vuwu5tuHsP/5QTHH3NhaXmVOuf5Q5eiDvwHgZVjwy43cM+S95x1bIbKQjJGsDePrx7duXUTa7LgIc+iGx3iU4ge8oeB8Z+Y5xD5pgysB7mg3ByQEONZTGa+q8nInrr9C6mvA99MEh7ADx3VCu74wYRk3XRZkK8ogBi1g90GI3+CQ2gpm7ACPQYxkrB25ylmXcLltol70bbwVSo1sjRy/cSk4zjcczD8b9uuGrxb/LoXT88BiA1kgeG31v5uZYsHI0B4w+FITsCREqM82Wz41uHKAVScNhO0mzPXQDQWJXFElKeWa8Xhq38TUE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zR2xBlNBjyMrgakoFVjgFIvXwsEetuTKNoMcU1ZhPrE3yjJ/4GX8BPZRrb4t?=
 =?us-ascii?Q?BSC4sizsu45QhC9OMtHetufluI6i1SL8wAiY0BGUL3l0yXRBqaHvdB3ugs7h?=
 =?us-ascii?Q?F5b2LEBdkMnuBXbMCAhHlOa3RQnLHKkC//C9iYAbSLoZTXVaAiR+uhhCH4XT?=
 =?us-ascii?Q?wZc2iuEC3YUZV8RWjZQaFLH/4wv9JxAfbKN8JK3b/I0A2w2rLTtUM+BRsMtk?=
 =?us-ascii?Q?a39KfFDEVoyjfRKwDB1kzGgQ5hviKuML0n2UuLqi5Sk+yNX6CKqTsPujhO9D?=
 =?us-ascii?Q?cb7zWEbyhQWT30lds3Md5NxfOdWmMpAskRqKyRotcfcvaS3QEFMyNm57zN9t?=
 =?us-ascii?Q?SZeEGlgCi/IqM1FtyjrcMsRmmGwmsLIM8li4l1WH+T0mgUQ0c9Bej5+Kuitt?=
 =?us-ascii?Q?6STTKD4UUb74rJi8vNzCCEz92dCgcwJDsSSTwxrybo+57Jui8PBdGeMGIHTp?=
 =?us-ascii?Q?YsPJGgO3s/UJOq7eJMh8TgWAHva4jet9EogMPgleC+z2Y0vR3XLs3BIoV+fe?=
 =?us-ascii?Q?ZK+5BuQlaXUK3IMdfxBIL8oVEek4/FYtu2JFXpqVL2tXC5shHQ3b4rV/xD9R?=
 =?us-ascii?Q?isO/b5dY0T87g70W0+1VWjlh1PlTj7hBzzykXxR6rjIgH5YOuMyb3jVTAMko?=
 =?us-ascii?Q?QRDczFuCP+N+tm6CkiUoRSgPpjDJKz1IIpf4kPQc70iXPWt4jOF2RrlHGAbg?=
 =?us-ascii?Q?t2ctcH4iRn453bjl6RJvqqYBQN0c0uHcIgOyalf2BNzwW+yanf5qIsJlDq+C?=
 =?us-ascii?Q?hEpuGiCK6XfFe/gj78ln5PB+1jrW+rfYm2+ZqDlzPnK3yFuHpNlEI5ceTQCA?=
 =?us-ascii?Q?GYcDr5mGwAo+Eldtb8cjSqjLBNR9LOHaEWFWctG6lXWIzdmrTzL7a0v+8/Gj?=
 =?us-ascii?Q?c+uMkzFX0MgTcV/wZSNH4pYW5ZcIibcuxgCmOmaOzqKu2k/+J5yiuXDumUH/?=
 =?us-ascii?Q?mtn+CVxsLQTCIc366sLJYuqWzD3yI+JnqR5Mu11wpHWXHI1XsTJCRMwVyxyX?=
 =?us-ascii?Q?E9i7/WJakK+YhJDrby9/tUlYvLoJWwo/zaEy8BzL5g/g2ixdFDcX6LkolK8A?=
 =?us-ascii?Q?Uk7q9jRVtkF1f+Z23VMLN3BbzieFae9YiMtZApYBizTMo4o9xEMM3CybRGN1?=
 =?us-ascii?Q?/TAh/qk85I0/igrYIyTh2rkbtJy7QDB4OkNe6D9cJJ+pp+RVMSeK8rdIErNe?=
 =?us-ascii?Q?+kwmHzAW5wtYHneU8wi4/B2Odh8dGZTWKNA3ny4WqzFyDAQUyOqPvQJ4mnfe?=
 =?us-ascii?Q?tR6nEROtbqFlD3iaCzUUMj11RSECWXlI9NI/1V3SpKYBPnGInW/JoLt7jmxf?=
 =?us-ascii?Q?RDMV+SD9an5PlzmTBmAoZ/rjhDTmNEov7+jMyoyJiu3xQNrJsPV5uhbrHgDC?=
 =?us-ascii?Q?IJPHCsnOA24u7Vui00SY7ihm5aQyxeeVKAqiUsffYyA3Jyi9R1ZsqXrn/Kbr?=
 =?us-ascii?Q?AT6jjdpYTkO+FQhCMSB/pFMp5zW0KQASnf0KHoqLKuu5hK13yWJ6OFjllav5?=
 =?us-ascii?Q?Zmb4IboUDpKw9YByu4QEVrEddAamVh7NzP46SHPV7YPIRU4GL836UlN6ZClx?=
 =?us-ascii?Q?/eJ9pHecqOsZASqz5zEf9yAQf1CT3fHnCZoXU7p5Lfye5BmGU5w8Aqn2nTMl?=
 =?us-ascii?Q?Ar7cgegOsQoz59O2dGZHIABlUBEc+TwVRaoF+HAhgut4wPNldHN1CnJlNBfe?=
 =?us-ascii?Q?0WPYXqPVrowiqgloGbYTitEXCcLGI/x3QL4s49mWfaUY6kSKGUHMQVu7pMSQ?=
 =?us-ascii?Q?i2J1gPv+Ow=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bab6398e-ea94-4121-f4f0-08de88df681f
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 13:23:43.8897
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: trOBFXJDoRF5jFY90zDVtBcntQvHXuwsVHKladnECpsnA59X9bHDe16UcHAYLsOM25uCkMnBZujGhUmQVJUd2H1K7GIFNYnEzpceEcoOvSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7100
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30110-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,glider.be,baylibre.com,kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,microchip.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:dkim,microchip.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 901292F2F19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

> -----Original Message-----
> From: Biju <biju.das.au@gmail.com>
> Sent: 20 March 2026 10:50
> Subject: [PATCH v7 01/10] dt-bindings: clock: Document RZ/G3L SoC
>=20
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> Document the device tree bindings for the Renesas RZ/G3L SoC Clock Pulse =
Generator (CPG). RZ/G3L CPG
> is similar to RZ/G2L CPG but has 5 clocks compared to 1 clock on other So=
Cs.
>=20
> Also define RZ/G3L (R9A08G046) Clock Pulse Generator Core Clocks, as list=
ed in section 4.4.4.1 ("Block
> Diagram of the Clock System"), module clock outputs, as listed in section=
 4.4.2 ("Clock List r1.00")
> and add Reset definitions referring to registers CPG_RST_* in Section 4.4=
.3
> ("Register") of the RZ/G3L Hardware User's Manual (Rev.1.00 Oct, 2025).
>=20
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v6->v7:
>  * No change
> v5->v6:
>  * No change
> v4->v5:
>  * No change
> v3->v4:
>  * Updated commit description related to core clocks section in
>    the hardware manual
>  * Dropped CLK_P4_DIV2 from core clocks
>  * Added MIPI_DSI_PLLCLK and USB_SCLK to core clocks
>  * Dropped LVDS_PCLK  module clock
>  * Added BSC_X_PRESET_BSC reset
> v2->v3:
>  * Added macros R9A08G046_ETH{0,1}_CLK_{TX,RX}_I_RMII.
>  * Keep the tag from Conor as it is trivial change for just adding macros=
.
> v1->v2:
>  * Documented external ethernet clocks as it is a clock source for MUX
>    inside CPG
>  * Updated commit description.
>  * Keep the tag from Conor as it is trivial change for adding more
>    clks.
> ---
>  .../bindings/clock/renesas,rzg2l-cpg.yaml     |  40 +-
>  include/dt-bindings/clock/r9a08g046-cpg.h     | 342 ++++++++++++++++++
>  2 files changed, 377 insertions(+), 5 deletions(-)  create mode 100644 i=
nclude/dt-
> bindings/clock/r9a08g046-cpg.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.ya=
ml
> b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> index 8c18616e5c4d..c0ce687d83ee 100644
> --- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> +++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
> @@ -28,19 +28,30 @@ properties:
>        - renesas,r9a07g044-cpg # RZ/G2{L,LC}
>        - renesas,r9a07g054-cpg # RZ/V2L
>        - renesas,r9a08g045-cpg # RZ/G3S
> +      - renesas,r9a08g046-cpg # RZ/G3L
>        - renesas,r9a09g011-cpg # RZ/V2M
>=20
>    reg:
>      maxItems: 1
>=20
>    clocks:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: Clock source to CPG can be either from external clo=
ck
> +                     input (EXCLK) or crystal oscillator (XIN/XOUT).
> +      - description: ETH0 TXC clock input
> +      - description: ETH0 RXC clock input
> +      - description: ETH1 TXC clock input
> +      - description: ETH1 RXC clock input
>=20
>    clock-names:
> -    description:
> -      Clock source to CPG can be either from external clock input (EXCLK=
) or
> -      crystal oscillator (XIN/XOUT).
> -    const: extal
> +    minItems: 1
> +    items:
> +      - const: extal
> +      - const: eth0_txc_tx_clk
> +      - const: eth0_rxc_rx_clk
> +      - const: eth1_txc_tx_clk
> +      - const: eth1_rxc_rx_clk
>=20
>    '#clock-cells':
>      description: |
> @@ -74,6 +85,25 @@ required:
>    - '#power-domain-cells'
>    - '#reset-cells'
>=20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: renesas,r9a08g046-cpg
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 5
> +        clock-names:
> +          minItems: 5
> +    else:
> +      properties:
> +        clocks:
> +          maxItems: 1
> +        clock-names:
> +          maxItems: 1
> +
>  additionalProperties: false
>=20
>  examples:
> diff --git a/include/dt-bindings/clock/r9a08g046-cpg.h b/include/dt-bindi=
ngs/clock/r9a08g046-cpg.h
> new file mode 100644
> index 000000000000..56b98e98cf88
> --- /dev/null
> +++ b/include/dt-bindings/clock/r9a08g046-cpg.h
> @@ -0,0 +1,342 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright (C) 2026 Renesas Electronics Corp.
> + */
> +#ifndef __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +#define __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* R9A08G046 CPG Core Clocks */
> +#define R9A08G046_CLK_I			0
> +#define R9A08G046_CLK_IC0		1
> +#define R9A08G046_CLK_IC1		2
> +#define R9A08G046_CLK_IC2		3
> +#define R9A08G046_CLK_IC3		4
> +#define R9A08G046_CLK_P0		5
> +#define R9A08G046_CLK_P1		6
> +#define R9A08G046_CLK_P2		7
> +#define R9A08G046_CLK_P3		8
> +#define R9A08G046_CLK_P4		9
> +#define R9A08G046_CLK_P5		10
> +#define R9A08G046_CLK_P6		11
> +#define R9A08G046_CLK_P7		12
> +#define R9A08G046_CLK_P8		13
> +#define R9A08G046_CLK_P9		14
> +#define R9A08G046_CLK_P10		15
> +#define R9A08G046_CLK_P13		16
> +#define R9A08G046_CLK_P14		17
> +#define R9A08G046_CLK_P15		18
> +#define R9A08G046_CLK_P16		19
> +#define R9A08G046_CLK_P17		20
> +#define R9A08G046_CLK_P18		21
> +#define R9A08G046_CLK_P19		22
> +#define R9A08G046_CLK_P20		23
> +#define R9A08G046_CLK_M0		24
> +#define R9A08G046_CLK_M1		25
> +#define R9A08G046_CLK_M2		26
> +#define R9A08G046_CLK_M3		27
> +#define R9A08G046_CLK_M4		28
> +#define R9A08G046_CLK_M5		29
> +#define R9A08G046_CLK_M6		30
> +#define R9A08G046_CLK_AT		31
> +#define R9A08G046_CLK_B			32
> +#define R9A08G046_CLK_ETHTX01		33
> +#define R9A08G046_CLK_ETHTX02		34
> +#define R9A08G046_CLK_ETHRX01		35
> +#define R9A08G046_CLK_ETHRX02		36
> +#define R9A08G046_CLK_ETHRM0		37
> +#define R9A08G046_CLK_ETHTX11		38
> +#define R9A08G046_CLK_ETHTX12		39
> +#define R9A08G046_CLK_ETHRX11		40
> +#define R9A08G046_CLK_ETHRX12		41
> +#define R9A08G046_CLK_ETHRM1		42
> +#define R9A08G046_CLK_G			43
> +#define R9A08G046_CLK_HP		44
> +#define R9A08G046_CLK_SD0		45
> +#define R9A08G046_CLK_SD1		46
> +#define R9A08G046_CLK_SD2		47
> +#define R9A08G046_CLK_SPI0		48
> +#define R9A08G046_CLK_SPI1		49
> +#define R9A08G046_CLK_S0		50
> +#define R9A08G046_CLK_SWD		51
> +#define R9A08G046_OSCCLK		52
> +#define R9A08G046_OSCCLK2		53
> +#define R9A08G046_MIPI_DSI_PLLCLK	54
> +#define R9A08G046_USB_SCLK		55
> +
> +/* R9A08G046 Module Clocks */
> +#define R9A08G046_CA55_SCLK		0
> +#define R9A08G046_CA55_PCLK		1
> +#define R9A08G046_CA55_ATCLK		2
> +#define R9A08G046_CA55_GICCLK		3
> +#define R9A08G046_CA55_PERICLK		4
> +#define R9A08G046_CA55_ACLK		5
> +#define R9A08G046_CA55_TSCLK		6
> +#define R9A08G046_CA55_CORECLK0		7
> +#define R9A08G046_CA55_CORECLK1		8
> +#define R9A08G046_CA55_CORECLK2		9
> +#define R9A08G046_CA55_CORECLK3		10
> +#define R9A08G046_SRAM_ACPU_ACLK0	11
> +#define R9A08G046_SRAM_ACPU_ACLK1	12
> +#define R9A08G046_SRAM_ACPU_ACLK2	13
> +#define R9A08G046_GIC600_GICCLK		14
> +#define R9A08G046_IA55_CLK		15
> +#define R9A08G046_IA55_PCLK		16
> +#define R9A08G046_MHU_PCLK		17
> +#define R9A08G046_SYC_CNT_CLK		18
> +#define R9A08G046_DMAC_ACLK		19
> +#define R9A08G046_DMAC_PCLK		20
> +#define R9A08G046_OSTM0_PCLK		21
> +#define R9A08G046_OSTM1_PCLK		22
> +#define R9A08G046_OSTM2_PCLK		23
> +#define R9A08G046_MTU_X_MCK_MTU3	24
> +#define R9A08G046_POE3_CLKM_POE		25
> +#define R9A08G046_GPT_PCLK		26
> +#define R9A08G046_POEG_A_CLKP		27
> +#define R9A08G046_POEG_B_CLKP		28
> +#define R9A08G046_POEG_C_CLKP		29
> +#define R9A08G046_POEG_D_CLKP		30
> +#define R9A08G046_WDT0_PCLK		31
> +#define R9A08G046_WDT0_CLK		32
> +#define R9A08G046_WDT1_PCLK		33
> +#define R9A08G046_WDT1_CLK		34
> +#define R9A08G046_WDT2_PCLK		35
> +#define R9A08G046_WDT2_CLK		36
> +#define R9A08G046_XSPI_HCLK		37
> +#define R9A08G046_XSPI_ACLK		38
> +#define R9A08G046_XSPI_CLK		39
> +#define R9A08G046_XSPI_CLKX2		40
> +#define R9A08G046_SDHI0_IMCLK		41
> +#define R9A08G046_SDHI0_IMCLK2		42
> +#define R9A08G046_SDHI0_CLK_HS		43
> +#define R9A08G046_SDHI0_IACLKS		44
> +#define R9A08G046_SDHI0_IACLKM		45
> +#define R9A08G046_SDHI1_IMCLK		46
> +#define R9A08G046_SDHI1_IMCLK2		47
> +#define R9A08G046_SDHI1_CLK_HS		48
> +#define R9A08G046_SDHI1_IACLKS		49
> +#define R9A08G046_SDHI1_IACLKM		50
> +#define R9A08G046_SDHI2_IMCLK		51
> +#define R9A08G046_SDHI2_IMCLK2		52
> +#define R9A08G046_SDHI2_CLK_HS		53
> +#define R9A08G046_SDHI2_IACLKS		54
> +#define R9A08G046_SDHI2_IACLKM		55
> +#define R9A08G046_GE3D_CLK		56
> +#define R9A08G046_GE3D_AXI_CLK		57
> +#define R9A08G046_GE3D_ACE_CLK		58
> +#define R9A08G046_ISU_ACLK		59
> +#define R9A08G046_ISU_PCLK		60
> +#define R9A08G046_H264_CLK_A		61
> +#define R9A08G046_H264_CLK_P		62
> +#define R9A08G046_CRU_SYSCLK		63
> +#define R9A08G046_CRU_VCLK		64
> +#define R9A08G046_CRU_PCLK		65
> +#define R9A08G046_CRU_ACLK		66
> +#define R9A08G046_MIPI_DSI_SYSCLK	67
> +#define R9A08G046_MIPI_DSI_ACLK		68
> +#define R9A08G046_MIPI_DSI_PCLK		69
> +#define R9A08G046_MIPI_DSI_VCLK		70
> +#define R9A08G046_MIPI_DSI_LPCLK	71
> +#define R9A08G046_LVDS_PLLCLK		72
> +#define R9A08G046_LVDS_CLK_DOT0		73
> +#define R9A08G046_LCDC_CLK_A		74
> +#define R9A08G046_LCDC_CLK_D		75
> +#define R9A08G046_LCDC_CLK_P		76
> +#define R9A08G046_SSI0_PCLK2		77
> +#define R9A08G046_SSI0_PCLK_SFR		78
> +#define R9A08G046_SSI1_PCLK2		79
> +#define R9A08G046_SSI1_PCLK_SFR		80
> +#define R9A08G046_SSI2_PCLK2		81
> +#define R9A08G046_SSI2_PCLK_SFR		82
> +#define R9A08G046_SSI3_PCLK2		83
> +#define R9A08G046_SSI3_PCLK_SFR		84
> +#define R9A08G046_USB_U2H0_HCLK		85
> +#define R9A08G046_USB_U2H1_HCLK		86
> +#define R9A08G046_USB_U2P0_EXR_CPUCLK	87
> +#define R9A08G046_USB_U2P1_EXR_CPUCLK	88
> +#define R9A08G046_USB_PCLK		89
> +#define R9A08G046_ETH0_CLK_AXI		90
> +#define R9A08G046_ETH0_CLK_CHI		91
> +#define R9A08G046_ETH0_CLK_TX_I		92
> +#define R9A08G046_ETH0_CLK_RX_I		93
> +#define R9A08G046_ETH0_CLK_TX_180_I	94
> +#define R9A08G046_ETH0_CLK_RX_180_I	95
> +#define R9A08G046_ETH0_CLK_RMII_I	96
> +#define R9A08G046_ETH0_CLK_PTP_REF_I	97
> +#define R9A08G046_ETH0_CLK_TX_I_RMII	98
> +#define R9A08G046_ETH0_CLK_RX_I_RMII	99
> +#define R9A08G046_ETH1_CLK_AXI		100
> +#define R9A08G046_ETH1_CLK_CHI		101
> +#define R9A08G046_ETH1_CLK_TX_I		102
> +#define R9A08G046_ETH1_CLK_RX_I		103
> +#define R9A08G046_ETH1_CLK_TX_180_I	104
> +#define R9A08G046_ETH1_CLK_RX_180_I	105
> +#define R9A08G046_ETH1_CLK_RMII_I	106
> +#define R9A08G046_ETH1_CLK_PTP_REF_I	107
> +#define R9A08G046_ETH1_CLK_TX_I_RMII	108
> +#define R9A08G046_ETH1_CLK_RX_I_RMII	109
> +#define R9A08G046_I2C0_PCLK		110
> +#define R9A08G046_I2C1_PCLK		111
> +#define R9A08G046_I2C2_PCLK		112
> +#define R9A08G046_I2C3_PCLK		113
> +#define R9A08G046_SCIF0_CLK_PCK		114
> +#define R9A08G046_SCIF1_CLK_PCK		115
> +#define R9A08G046_SCIF2_CLK_PCK		116
> +#define R9A08G046_SCIF3_CLK_PCK		117
> +#define R9A08G046_SCIF4_CLK_PCK		118
> +#define R9A08G046_SCIF5_CLK_PCK		119
> +#define R9A08G046_RSCI0_PCLK		120
> +#define R9A08G046_RSCI0_TCLK		121
> +#define R9A08G046_RSCI1_PCLK		122
> +#define R9A08G046_RSCI1_TCLK		123
> +#define R9A08G046_RSCI2_PCLK		124
> +#define R9A08G046_RSCI2_TCLK		125
> +#define R9A08G046_RSCI3_PCLK		126
> +#define R9A08G046_RSCI3_TCLK		127
> +#define R9A08G046_RSPI0_PCLK		128
> +#define R9A08G046_RSPI0_TCLK		129
> +#define R9A08G046_RSPI1_PCLK		130
> +#define R9A08G046_RSPI1_TCLK		131
> +#define R9A08G046_RSPI2_PCLK		132
> +#define R9A08G046_RSPI2_TCLK		133
> +#define R9A08G046_CANFD_PCLK		134
> +#define R9A08G046_CANFD_CLK_RAM		135
> +#define R9A08G046_GPIO_HCLK		136
> +#define R9A08G046_ADC0_ADCLK		137
> +#define R9A08G046_ADC0_PCLK		138
> +#define R9A08G046_ADC1_ADCLK		138

Oops, typo should be 138.

Cheers,
Biju

> +#define R9A08G046_ADC1_PCLK		140
> +#define R9A08G046_TSU_PCLK		141
> +#define R9A08G046_PDM_PCLK		142
> +#define R9A08G046_PDM_CCLK		143
> +#define R9A08G046_PCI_ACLK		144
> +#define R9A08G046_PCI_CLKL1PM		145
> +#define R9A08G046_PCI_CLK_PMU		146
> +#define R9A08G046_SPDIF_PCLK		147
> +#define R9A08G046_I3C_TCLK		148
> +#define R9A08G046_I3C_PCLK		149
> +#define R9A08G046_VBAT_BCLK		150
> +#define R9A08G046_BSC_X_BCK_BSC		151
> +
> +/* R9A08G046 Resets */
> +#define R9A08G046_CA55_RST0_0		0
> +#define R9A08G046_CA55_RST0_1		1
> +#define R9A08G046_CA55_RST0_2		2
> +#define R9A08G046_CA55_RST0_3		3
> +#define R9A08G046_CA55_RST4_0		4
> +#define R9A08G046_CA55_RST4_1		5
> +#define R9A08G046_CA55_RST4_2		6
> +#define R9A08G046_CA55_RST4_3		7
> +#define R9A08G046_CA55_RST8		8
> +#define R9A08G046_CA55_RST9		9
> +#define R9A08G046_CA55_RST10		10
> +#define R9A08G046_CA55_RST11		11
> +#define R9A08G046_CA55_RST12		12
> +#define R9A08G046_CA55_RST13		13
> +#define R9A08G046_CA55_RST14		14
> +#define R9A08G046_CA55_RST15		15
> +#define R9A08G046_CA55_RST16		16
> +#define R9A08G046_SRAM_ACPU_ARESETN0	17
> +#define R9A08G046_SRAM_ACPU_ARESETN1	18
> +#define R9A08G046_SRAM_ACPU_ARESETN2	19
> +#define R9A08G046_GIC600_GICRESET_N	20
> +#define R9A08G046_GIC600_DBG_GICRESET_N	21
> +#define R9A08G046_IA55_RESETN		22
> +#define R9A08G046_MHU_RESETN		23
> +#define R9A08G046_SYC_RESETN		24
> +#define R9A08G046_DMAC_ARESETN		25
> +#define R9A08G046_DMAC_RST_ASYNC	26
> +#define R9A08G046_GTM0_PRESETZ		27
> +#define R9A08G046_GTM1_PRESETZ		28
> +#define R9A08G046_GTM2_PRESETZ		29
> +#define R9A08G046_MTU_X_PRESET_MTU3	30
> +#define R9A08G046_POE3_RST_M_REG	31
> +#define R9A08G046_GPT_RST_C		32
> +#define R9A08G046_POEG_A_RST		33
> +#define R9A08G046_POEG_B_RST		34
> +#define R9A08G046_POEG_C_RST		35
> +#define R9A08G046_POEG_D_RST		36
> +#define R9A08G046_WDT0_PRESETN		37
> +#define R9A08G046_WDT1_PRESETN		38
> +#define R9A08G046_WDT2_PRESETN		39
> +#define R9A08G046_XSPI_HRESETN		40
> +#define R9A08G046_XSPI_ARESETN		41
> +#define R9A08G046_SDHI0_IXRST		42
> +#define R9A08G046_SDHI1_IXRST		43
> +#define R9A08G046_SDHI2_IXRST		44
> +#define R9A08G046_SDHI0_IXRSTAXIM	45
> +#define R9A08G046_SDHI0_IXRSTAXIS	46
> +#define R9A08G046_SDHI1_IXRSTAXIM	47
> +#define R9A08G046_SDHI1_IXRSTAXIS	48
> +#define R9A08G046_SDHI2_IXRSTAXIM	49
> +#define R9A08G046_SDHI2_IXRSTAXIS	50
> +#define R9A08G046_GE3D_RESETN		51
> +#define R9A08G046_GE3D_AXI_RESETN	52
> +#define R9A08G046_GE3D_ACE_RESETN	53
> +#define R9A08G046_ISU_ARESETN		54
> +#define R9A08G046_ISU_PRESETN		55
> +#define R9A08G046_H264_X_RESET_VCP	56
> +#define R9A08G046_H264_CP_PRESET_P	57
> +#define R9A08G046_CRU_CMN_RSTB		58
> +#define R9A08G046_CRU_PRESETN		59
> +#define R9A08G046_CRU_ARESETN		60
> +#define R9A08G046_MIPI_DSI_CMN_RSTB	61
> +#define R9A08G046_MIPI_DSI_ARESET_N	62
> +#define R9A08G046_MIPI_DSI_PRESET_N	63
> +#define R9A08G046_LCDC_RESET_N		64
> +#define R9A08G046_SSI0_RST_M2_REG	65
> +#define R9A08G046_SSI1_RST_M2_REG	66
> +#define R9A08G046_SSI2_RST_M2_REG	67
> +#define R9A08G046_SSI3_RST_M2_REG	68
> +#define R9A08G046_USB_U2H0_HRESETN	69
> +#define R9A08G046_USB_U2H1_HRESETN	70
> +#define R9A08G046_USB_U2P0_EXL_SYSRST	71
> +#define R9A08G046_USB_PRESETN		72
> +#define R9A08G046_USB_U2P1_EXL_SYSRST	73
> +#define R9A08G046_ETH0_ARESET_N		74
> +#define R9A08G046_ETH1_ARESET_N		75
> +#define R9A08G046_I2C0_MRST		76
> +#define R9A08G046_I2C1_MRST		77
> +#define R9A08G046_I2C2_MRST		78
> +#define R9A08G046_I2C3_MRST		79
> +#define R9A08G046_SCIF0_RST_SYSTEM_N	80
> +#define R9A08G046_SCIF1_RST_SYSTEM_N	81
> +#define R9A08G046_SCIF2_RST_SYSTEM_N	82
> +#define R9A08G046_SCIF3_RST_SYSTEM_N	83
> +#define R9A08G046_SCIF4_RST_SYSTEM_N	84
> +#define R9A08G046_SCIF5_RST_SYSTEM_N	85
> +#define R9A08G046_RSPI0_PRESETN		86
> +#define R9A08G046_RSPI1_PRESETN		87
> +#define R9A08G046_RSPI2_PRESETN		88
> +#define R9A08G046_RSPI0_TRESETN		89
> +#define R9A08G046_RSPI1_TRESETN		90
> +#define R9A08G046_RSPI2_TRESETN		91
> +#define R9A08G046_CANFD_RSTP_N		92
> +#define R9A08G046_CANFD_RSTC_N		93
> +#define R9A08G046_GPIO_RSTN		94
> +#define R9A08G046_GPIO_PORT_RESETN	95
> +#define R9A08G046_GPIO_SPARE_RESETN	96
> +#define R9A08G046_ADC0_PRESETN		97
> +#define R9A08G046_ADC0_ADRST_N		98
> +#define R9A08G046_ADC1_PRESETN		99
> +#define R9A08G046_ADC1_ADRST_N		100
> +#define R9A08G046_TSU_PRESETN		101
> +#define R9A08G046_PDM_PRESETN		102
> +#define R9A08G046_PCI_ARESETN		103
> +#define R9A08G046_SPDIF_RST		104
> +#define R9A08G046_I3C_TRESETN		105
> +#define R9A08G046_I3C_PRESETN		106
> +#define R9A08G046_VBAT_BRESETN		107
> +#define R9A08G046_RSCI0_PRESETN		108
> +#define R9A08G046_RSCI1_PRESETN		109
> +#define R9A08G046_RSCI2_PRESETN		110
> +#define R9A08G046_RSCI3_PRESETN		111
> +#define R9A08G046_RSCI0_TRESETN		112
> +#define R9A08G046_RSCI1_TRESETN		113
> +#define R9A08G046_RSCI2_TRESETN		114
> +#define R9A08G046_RSCI3_TRESETN		115
> +#define R9A08G046_LVDS_RESET_N		116
> +#define R9A08G046_BSC_X_PRESET_BSC	117
> +
> +#endif /* __DT_BINDINGS_CLOCK_R9A08G046_CPG_H__ */
> --
> 2.43.0


