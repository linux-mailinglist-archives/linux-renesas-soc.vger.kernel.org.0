Return-Path: <linux-renesas-soc+bounces-34791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k1JoISOzTGp5oQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 10:04:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5664718DD0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 10:04:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=FUPc+5dQ;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C5AA303E4DD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 08:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C59E2D780E;
	Tue,  7 Jul 2026 08:04:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010023.outbound.protection.outlook.com [52.101.229.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1802F2C0296;
	Tue,  7 Jul 2026 08:04:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783411460; cv=fail; b=il6WyIpUvdBDixeGsj6itxFD6dMQOWF7dPSyYPHDnn11AonDAGZ5cl/ghufQShQ5y6eEqynkI7jEwVckMCsQGa25qs9AviFKLEb1WZ8LferFuR7ganfQcWZkWb4vYB/r2KctKnskrs9vlWMJeCDdn35VDwAoHentBvI1lZdmwc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783411460; c=relaxed/simple;
	bh=V+eBXlt1eNPNRz/qNEOCzTbdZ1+C2nuY5lQe60ZYYfE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZgY3Ao5WLkUZvFwZ+aF2n0RHxwLJR5x7m/U++nMIAyHr58NearTVBoSO5LgX1mpgRIqVMHlG1w30huKCApBXb6S+vOCxSxoFmJi5jKnJd6mfJqGYDZbFP0kByyTnJN5Z5P1JTOKGAFIbREv+4eOsse74OBEhd1mT5vwqV4961i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=FUPc+5dQ; arc=fail smtp.client-ip=52.101.229.23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9TwDzKNFzXXsXJPnKOdrqVeayv4s74SfVWLv9omus1Wkv6AMO8XOLjPG4t1Z+iabmln85mzLPjp3zNRmuuXQVdtDfjRGrtaIRkVi7l50SY1+gtsmcMluuq9wmt/6mmovgy06Kcsi0uq8WJiZE7Tn+gOEHk/3V6GcaPFya3D5dnjscg9tQ8M2GP+iAIvOGRSaBvJ8uq8qoGnhvtwzIgKEUcV4irNufvKXihN003h4lUXa+X7dxvaaz7QnBTYYJkhUVZkk/SSg4ZWIMYSYiSlKvPihHB2I0m0njNuCLtRLVU2deNQUMXgXlNfmIEHKvc33Pt+CmbNNRbHIxKbDmcXmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iMIg1YdMVK454ZbjqPnSP+X/z8FApiIrTVwTdVc3N6E=;
 b=wraVkh6NiPZkT++v42Qa9W8ZvmwEFEmtfFq1rie1LI6ndWTbyLLte1BbNuTi5qJieDk8l9B3k+yKtBQ4ZavzbWagh45HKfeOwSMvTSFSswYfhIPJ/idk23vS542kCqxO1tKp5Bfihv+vIMDWjS5ETzihJ4xcx1t2iCmfREOUjXnWlYiu8AN5zTPd5gsjQcGfvajGio9lUdJjpG1E2HxiMSIp56xpGdwhaL1r096nQnMNSOLf9/UIXMTskLIhzyuHLqAj0MgWEYltRc/o4oGs0ZitlqyUhxjncjOMJWbukMfy1IL76HX5QOwb773rPI/+dSqxnIkQyIqMJWoUU8Z02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMIg1YdMVK454ZbjqPnSP+X/z8FApiIrTVwTdVc3N6E=;
 b=FUPc+5dQeubNlGHnIelVsrogUcmYQt77mYUPRmy18B2b6L3NvA3mJLfYkqR0Yr22tPHkT1ukQ13zRKDnQyGMfIe1PwOfRd1fuwrL8naVYlVj9iuELwZjLc17nT5Vx+/bL574Vn49+wqsdINDhVWo05mxcUIYokC/sLMjrBpzyjU=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB13340.jpnprd01.prod.outlook.com (2603:1096:405:1c9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 08:04:15 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 08:04:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: wsa+renesas <wsa+renesas@sang-engineering.com>, biju.das.au
	<biju.das.au@gmail.com>
CC: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, magnus.damm <magnus.damm@gmail.com>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document RZ/G3L
 (r9a08g046) SoC
Thread-Topic: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document
 RZ/G3L (r9a08g046) SoC
Thread-Index: AQHc8yZGZL+xVT0kJkKzynWtJHSRPLZCwOEAgAAClbCAHyA78A==
Date: Tue, 7 Jul 2026 08:04:14 +0000
Message-ID:
 <TY3PR01MB11346E7DDF07F2CEFE411ECCA86F02@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
 <20260603065731.93243-2-biju.das.jz@bp.renesas.com>
 <ajKQ5OzGvWg3kBYa@shikoro>
 <TY3PR01MB11346EA69F7C78DE7D07F3D6386E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To:
 <TY3PR01MB11346EA69F7C78DE7D07F3D6386E42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB13340:EE_
x-ms-office365-filtering-correlation-id: a25910dd-dd48-453f-c6bc-08dedbfe5659
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|38070700021|22082099003|18002099003|4143699003|11063799006|56012099006;
x-microsoft-antispam-message-info:
 /RqmnvFygDJ35iPRsizdLfDJtWg09RxJEQKu56MwQbh40gkccv+UlYSg4rcQRc6jyUEx0VuQW0f229XSw1EePMxcuRsjx6DA1fi55fUn7ZB8blETv9joOSvgUrEB1/0ioBt1BQ1H06GjjoIECHiQ8KjQJBFx33ksHX8oHhZHb7l2mzrjr8ws+WvV0ZTN8xLz5V3Mdu7VueJJ9WPTHIGweSTErgGWv4SwTaqG3064zX8QNEz15tFEjl3lDT8zFj/PGwiIqVkksbaHEdYRNWYGlrYmj7BXvUvhF62HrshwATLXF0lJx6KVvo8L5cLTpXtBC2GjH9nvVJmsBVlLWpec/MZb62FV32VDlsZYIGWJNN8aymaJxYKg0Ui7yVLOznpcUAR+0AlUO7FJ+fkaCozUn5l0wIUhIYTlXlkYrNQGHzUUIh5WHUDKMWosv686xmrDhzhimXc/ahJka/ifF8XrjRzFDa3AIWte6IYM+aWSvDgE1t4fYlbifu2XykQN4J11++JdcL5J7Y56gRQXwKOA5+0Mw6IM/hK4AKambhArECfqmA6SdnPaT7y1de1bAoJSAtgka0Uvkmgt4wWnhYUt9EfeGMfl2QH3p/HpGyIQ8oLecL+MQnlH5AlfHi/YDTBTzVVHyWyic1FW4c/b7CglgfQLpyIRPduzO7e8EjHAfruzjA3UwWnzhGAuo5BTpjQDaqYKNWhNJjKD+PnPNdPQpg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(38070700021)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ToqCw3Dg8zB2xSEvKtBNeirznTvCoZfm8hosRSg3NGW/LfYH7NG9w8IjsKLu?=
 =?us-ascii?Q?Z+wwcPms3Gl46/PdIsTvnQt6NDE/u7CsF6FZvH1AcQ/apnB/P6P9hP7/jX9x?=
 =?us-ascii?Q?Iu4YdablJ/KsuJyH2U3wAQqIZT4dGmjmXUt3xJWFu+fX9oUocriBzpnKmjmQ?=
 =?us-ascii?Q?aJLWzMRB+v/JKw8Gcdk1F41gZRcIs6O1LAGuNFnT9gxSObVt+oxc2nQy4pYq?=
 =?us-ascii?Q?QL6NG5FjKi/4qI3HYx5ZfWnroGWRo/SNKvXQtEA9hUXU6Pz+lMBz4IZla1Le?=
 =?us-ascii?Q?ZEj9v3EVfjMhZbYm4O8bHKnJO4HT1ayFXOg9267ZUvpY4lgxb/QmP0X9sikG?=
 =?us-ascii?Q?vUr6TDXm4c9L240yzHbJXlT1rzcH5Hw3FdqySmTyPVsCMoAEFBHmJvxgXRSh?=
 =?us-ascii?Q?A4c9YeQ3o0xyAoF+WkzbcbdA+IWrR4FbO530iI1JphYGeq+X/Qftr+Y0OCZi?=
 =?us-ascii?Q?DPK5gl3ijvLdE6vZW8CN8xaNLpCAuH6pM3Fw4fsj63vnhhhbLdXQlwZs0F7k?=
 =?us-ascii?Q?RED7iKrlmu45NJyuRjTw78CMryh5m8Fhsh1VD/Hx8KR4DfH601PtNRCi8Mxu?=
 =?us-ascii?Q?D8upqZpgdWxjL0poWOtpl+UQqWGtTYgqbmIrBTPsCFc6v1t+s3o+GtTDJqHF?=
 =?us-ascii?Q?AhVbozolUjv3OhnMbk7TEjWKpQKQoVPbm5xqtD78TCKg8UCpU8RcohBBI/y6?=
 =?us-ascii?Q?g3eOcbDK51ZedPDRZpz6Y3H9h3z8k/KteGjnNIAzbMf8hiH9OpeoOo0qewR9?=
 =?us-ascii?Q?SccInZCVAbp+5L0yl9sXKVMYIoHjbz8ui3sTBaBwPdd6scG4c6hpYgukE4Ja?=
 =?us-ascii?Q?VgnZzjqVqfW7GpyZNGJiGGUpDVZl5pu3vEACfJjabUzOPFgsTw/cT9O4ZrWZ?=
 =?us-ascii?Q?xkb7jhCE325f4siJ0TbMmAUHIIBzkndzxCMJxhojrhn/MF2r9z5GLM2Mca4U?=
 =?us-ascii?Q?fQrfdAsKIlb8PrdiFgnlEzYtpq6U7fiotH84F5b7yoLu6tFCe5bC9SqZ/FPh?=
 =?us-ascii?Q?e8RHcdcxlVeMqk2E5OxdtiyltKRVz9ytgaCeTJ1HPWiCjqErChPZhKX7pbAQ?=
 =?us-ascii?Q?wDaxhXG5SEXySJfLB6CQDdHqajz7ipc0geQ3OyOt67iFVDOuSjz354Bt3THO?=
 =?us-ascii?Q?lNpsExow/xE8i6htWPJuVWgiHpqxpikxVlo3wTUbCv9+m6Wze/zWs06DRlmn?=
 =?us-ascii?Q?2xIcUBRhUQF7VbnDKoGC6b0Vs8Xe4QYEmpFK4IndGDUaI51tbbyhEz+GsEUe?=
 =?us-ascii?Q?gguiMc2UJCHfA4FtpHIZ5OYslx5HXlVV7ikLa7JVYiAR1QaHtmgIPUMM9G+n?=
 =?us-ascii?Q?Ou9lRpRjo8jmaTImAd+maB0byhtkk27KfaUF/IwDTxqSnAI8Xe8mk5rnFphi?=
 =?us-ascii?Q?su8lEhdgJCTKOX//4vTF5PYr3qiUuSt89zGy5+1Pdof9QYD2axFGAu23SJsw?=
 =?us-ascii?Q?bCkbeH2fV2N6dM3QLUL/c0C3RhsbRIbfsISU8ss7MR28Sjlw7fE+ZSzGtFk7?=
 =?us-ascii?Q?ILoEqHfOMRw7NVCrhRYFvwxe8tarpL8SzUZNrkG+exX5yvdBNCobsP3zme04?=
 =?us-ascii?Q?lk135akLfmiz4bz5zNtt1Tmt4y5TPNNGoO3XQ/lefxIF/A9HySS1Nvx9ilyz?=
 =?us-ascii?Q?w6MT+wdla0xE3KwRptQayICUbVxkes7il4Bd0p2IYU2A9KgR6vICW3u4ka59?=
 =?us-ascii?Q?dNxBf6N/dHHunvxqVPHm6NzQrUtjY/EMwwf972MP09kr+e3fERMs6wJGFt36?=
 =?us-ascii?Q?zsWPTteSTA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a25910dd-dd48-453f-c6bc-08dedbfe5659
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jul 2026 08:04:14.9532
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OyhVRa4qSrN7wiySi0bJ6jZxM1Ppr/SRqj/zPuLN17jJU086h+cgYPNGdnlWHcmVPhNSX5g3+MznhC8R5cWdNxzjRQKB21Q0mpQq/lha84s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13340
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34791-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:biju.das.au@gmail.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:conor.dooley@microchip.com,m:wsa@sang-engineering.com,m:bijudasau@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[sang-engineering.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,microchip.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,microchip.com:email,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D5664718DD0

Hi Wolfram,

> -----Original Message-----
> From: Biju Das
> Sent: 17 June 2026 13:43
> Subject: RE: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi: Document R=
Z/G3L (r9a08g046) SoC
>=20
> Hi Wolfram,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Sent: 17 June 2026 13:20
> > Subject: Re: [PATCH v17 01/17] dt-bindings: mmc: renesas,sdhi:
> > Document RZ/G3L (r9a08g046) SoC
> >
> > Hi Biju,
> >
> > On Wed, Jun 03, 2026 at 07:57:01AM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Document the RZ/G3L (r9a08g046) SDHI controller. The RZ/G3L SDHI
> > > controller is similar to RZ/G2L but has five clocks (core, clkh, cd,
> > > aclk, aclkm) and three resets (rst, axim, axis), so update the
> > > clocks/clock-names maximum to 5 and resets/reset-names maximum to 3.
> > > It has an internal divider for all modes except HS400, and a
> > > 2048-bit divider compared to 512 on others.
> > >
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > I know you work on v18 already, but some high level remarks already.
>=20
> OK.
>=20
> >
> > > +              - description: ACLK/IACLKS, SDHI channel bus clock.
> > > +              - description: IACLKM, SDHI channel bus clock m.
> >
> > What does 's' and 'm' stand for? Is it mentioned in the docs? Would be =
nice to have here as well, if
> so.
>=20
> >
> > > +          resets:
> > > +            items:
> > > +              - description: rst, Core reset.
> > > +              - description: axim, SDHI axi bus reset m.
> > > +              - description: axis, SDHI axi bus reset s.
> >
> > Ditto.
>=20
> The reset signal mentioned in the hardware manual are SDHIx_IXRST, SDHIx_=
IXRSTAXIM and SDHIx_IXRSTAXIS
> (where x=3D0,1,2)
>=20
> I will check this as well with hardware/documentation team and update you=
.

I got feedback from hardware team

These clocks and reset signals are intended for the AXI Master and AXI Slav=
e
interfaces.

Do you agree free the below description? please let me know.

              - description: ACLK/IACLKM, SDHI channel bus clock/ AXI maste=
r bus clock.
              - description: IACLKS, SDHI channel AXI slave bus clock.
          clock-names:
            items:
              - const: core
              - const: clkh
              - const: cd
              - const: aclkm
              - const: aclks
          resets:
            items:
              - description: rst, Core reset.
              - description: axim, SDHI AXI master bus reset.
              - description: axis, SDHI AXI slave bus reset.

Cheers,
Biju



