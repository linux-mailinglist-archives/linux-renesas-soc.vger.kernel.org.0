Return-Path: <linux-renesas-soc+bounces-1800-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A23A83BA3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 07:45:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7636628E6F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 06:45:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB658467;
	Thu, 25 Jan 2024 06:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="A1GYluG1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2113.outbound.protection.outlook.com [40.107.114.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54919BE6E;
	Thu, 25 Jan 2024 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706165126; cv=fail; b=DHELV8vN1FvP8n9CLSLhdGNKcrcbUCVc6u9oe3PHaFt0sC4Z3xmhpSVln+KdxoZM7Dpyr6mzXFpxp5lI7kchJjQO56a5xSm2cQTWPs4/1CRjIMUAMANVTI5cus728XZbt9JR5OLxnsO6V/8wI0JvhhaQVzGsBQd/ny3BpfbpALs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706165126; c=relaxed/simple;
	bh=BNKjOHPOWS9KpBt5NlfkS/BG5tKlLs2+1gwtW88r64s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=igW/Mrky65ZCQ3pOoowTwNYf/mqpprbAjhRfJBhmre49cP2PMfAg4Eybwzd2pbKYrSLhtFWBqWjS/hg7acCVblRRKHH6nKa+vY6s59NRBzUoXtHXVi/J9aIJuRrxUYyxTrKdxFKU3n85COlMUK81emOCoYOoOM771IaDS8siMzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=A1GYluG1; arc=fail smtp.client-ip=40.107.114.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZxlD0t1mbS7yTWZ5DHaSbPwMYyWy469HNW6+3pFS90lLBuvF9Yee6frjKtQDcQaWXvdtexyfwCtblys3KubME7R52ISfBpC4xMEhgXMuRlcLicp9xTEN9OF8TSkKdFER28/RSsVXv1grKoqxl5al6SnRlU8drPE3h1q4vCjPeebYv2Z/k3HVlUIfIBvoUx1sYcS6nHRUkvfVHkAF7ew7kjgp3jpBPbTquJwwFpLDKtV34BsW8ey1kOa7m+cfmu/tT4Yoidg78NBi78X8wNY6fK1C/VCedwutJKdKsI1Nz28/0Hr8tldllQlmRmwvWqyfS/bBmuZHMV+7ICEsvH4Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNKjOHPOWS9KpBt5NlfkS/BG5tKlLs2+1gwtW88r64s=;
 b=YT2eSMIcWthLjtPt2aQ1aIv8bBaP0nzwg7e2uvHSCFG3g9NXXSVRNxt2dih+2/Hq7uLqD+z5hcKkzN8C0dv+ivjZz8+8RAwM7WSZZUlyrk633KGY9SkkEqTLBJQdQvNC56sRr898bSQgt46Fc1OwmnSzFj1rAeAk3fKFrMj2glRkr4fZiabXnlPDsCi8VilG7Gz379WhxjSak8vjx74jBOUYt6KP+Dn/tDGlct4cSU9PKGj7+Np3bLuaIlf/MNoYYUUzrRk+gLsdDOdrSYv9N/Ua0zD07gFMvIgl0S7TrjLNQ/1KxbmVi0CYLLeCEKNOUaXX8cOeTvwsUFoky7O4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNKjOHPOWS9KpBt5NlfkS/BG5tKlLs2+1gwtW88r64s=;
 b=A1GYluG1UWX4o19aJHRd3jx5gQKM8YGbLxc61nJniSd8PLbQe98rS44nufB2Iyt4oT6VMDM7YA26X1MomXHrMuILQPWoUW3fhRyHa8wJYanm7Br32nQkvmUuSDd3QLRJT5InrTkm/R+eyRAsnPzIdKDgI4Z4ZXhQ4o/j7gNt9Wk=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYYPR01MB8093.jpnprd01.prod.outlook.com
 (2603:1096:400:f9::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 06:45:18 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.026; Thu, 25 Jan 2024
 06:45:17 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Jakub Kicinski <kuba@kernel.org>
CC: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
	<edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, nikita.yoush
	<nikita.yoush@cogentembedded.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
Thread-Topic: [PATCH net-next 1/2] ravb: Add Rx checksum offload support
Thread-Index: AQHaTg+VEjiH3LyFqkWrw8nn5AoY4rDoJ82AgAB63UCAAM8zAIAApQSw
Date: Thu, 25 Jan 2024 06:45:17 +0000
Message-ID:
 <TYCPR01MB112695545C77D41544D8DEFCB867A2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123151924.373917-1-biju.das.jz@bp.renesas.com>
 <20240123151924.373917-2-biju.das.jz@bp.renesas.com>
 <20240123170921.51089d41@kernel.org>
 <TYCPR01MB11269BEF48F2C2C111C91858A867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <e71607dc-d51f-d5b9-e95a-c11b149083cb@omp.ru>
In-Reply-To: <e71607dc-d51f-d5b9-e95a-c11b149083cb@omp.ru>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYYPR01MB8093:EE_
x-ms-office365-filtering-correlation-id: ef5eb98e-d3fa-4491-3530-08dc1d713177
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 fezvGmpO6GjOBy3HO/Pt/7lw+JP4l4SdAHjNXKpmVbWZQSxBjGP5QBKyZ/b7dP+VkkAyyR9fjydzd6/Fzx/6tcEzHepgU55ideHJAgVRvXZ9Ez0wgipfCYLfIu7bR65wlRrsPrWEUFdtLz4nz1eFEIEQ5RxBe/y508jAKpIIytxxlxfaTR5PoYlwy9nNVhd5uLIKUZzwKNVVWEPm4CwV7tZKCvkdpsuxmoa/UI7F8hIGfaPwNnkoKd6yLpVqLCWBpvop5Lb4ZXeSaFdokpdMQM+VAT6hk33U0TuwlgeyFq6cmaf+cZYCIqQ7Rzvm7HXSS0Vadha3nFh5tNWKlqlLJsdpo1hHyKFVkHNf0GT9mcGOID+UIHiwwpelJkoI0wk8ELZ2t70vxUoIgaLnAvQmxj3xvctczFU5h8Q2SiALEvuFbDBiHNQ2pJegdP70FGdTfOKFTqANW0x2C9nkyNQ2E1RZ6vFz3RsWLJ/agrkqN6ZSmpmbU0/3ppcoewCQgm/UX0VfIqL54UofJ/ZONCa8hl1KJzkKYAwL3+x0JcHhCXOXv9/SuNSz3Wb2yTCdpY+Go3uE1ON+hCA4SMa+EKvAcGoH7o70QXZ3k1NEl/d1QuWCjEFBQzRb8CXzF86wn8raiL36aYZNOfBCBx4XegOSzg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(136003)(346002)(376002)(39860400002)(230273577357003)(230173577357003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(6506007)(9686003)(53546011)(26005)(478600001)(966005)(2906002)(33656002)(41300700001)(38070700009)(86362001)(71200400001)(66476007)(54906003)(8676002)(64756008)(316002)(66556008)(66446008)(7416002)(76116006)(83380400001)(110136005)(66946007)(8936002)(38100700002)(4326008)(5660300002)(52536014)(122000001)(7696005)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MXpMQm0wOG1PN1QvMkRsRnlOWmp6TGxrcXl1U1hSVDJsZDkyTXVidDVQbmc3?=
 =?utf-8?B?QUhTRitsUUZacmQ2K0I0Z1JMdWZEQXFsQ1dQNkxMelR5NllkM25yYXM3WEZL?=
 =?utf-8?B?VE11VmducjdaZWxieHRpbDhJeHJDSmpScm9Zc2RrdEhFYmRIZG4wMGpIWk0y?=
 =?utf-8?B?LzVZVUg3MGVpZjBQN3ZxN2FvNTBHemFrSm01SStMM1lhMThqeEVJRWEwdk92?=
 =?utf-8?B?NTBHYU1zMGZiWkd2a2RSaFJ3bkNOTnJ2THZYZFpmeEd5WlJRZWw0dkVNek9O?=
 =?utf-8?B?ZjQvSDI4QytTaW93eVI2RHJQM2I4amxtbmRtNUZpS3RITWxmaXBmcU0ySGl3?=
 =?utf-8?B?SnNWd2hiWWoxQzFLTFV5ak5UUkdoR3RObWpleWJrWnRycEpDeVd1WFBkU1Np?=
 =?utf-8?B?OVVNR01GKzVxeDZZUE82RElacEpRMUhDaXYrUEJxMXNYUUdKQSthc1NYN1BC?=
 =?utf-8?B?ZFlZNjlhZVBhRlhyOVdsNjZNWEhtajgzcllqWnlNTGdpejZFcUliQTlTTVI2?=
 =?utf-8?B?R2oyaXo1VU45MFQ3L2RzdXRsRG9qRlBmS1hpVEtQaER5MTY0UkV3aGg5RlN3?=
 =?utf-8?B?Q01ZMTd1a1VYdjFFYUg1ei92T1A0QkhWcDFyTC96R0RrY2IxQ0JVdlMvbVFG?=
 =?utf-8?B?dHgrbC96eGhBQjJ3emdQREVHNlhMNTNiN0hWSWt5NWg3UUFCVDZvUjZUR01k?=
 =?utf-8?B?akl2UlJmdmhqbzAwakVjbkVzMzFZZ0FPMHR0L1h3dUhUTUx2VkZmUUo0aEE2?=
 =?utf-8?B?NENjVHVYZzdNQWRNaHVNOHdGaHZGMnVOVnRVUVozeVYwVkFtR2gzbkNpS09K?=
 =?utf-8?B?UmpzKzIvbU1NbEtrMUwzOGdnWi84Y0ZqUGVrbW5zc2x0OGp3RWFQMDFVNFhs?=
 =?utf-8?B?N1JhM0RaeWlkUTd0bDdjdVVNTnVLQ3IzMWZLTnUvbUd5ZnZ0TFZTTVc5TFR1?=
 =?utf-8?B?eW9LTXphc1JVUmIrb0RYcU1GcFExRHE4d0pKeVpBNGxJRnJvb0dScGJMaDNE?=
 =?utf-8?B?TXQ4RGlsMDVBMFQ0OXp4NlNXNnR5dmR4RE8rSUpXS2JUSkRzKzV5ZXFEazh4?=
 =?utf-8?B?Y3luM0tSRW9uR21YWmIwWi91QXQwRmRCZTEvdjd2RHdCUktFdnBNRDBSejFC?=
 =?utf-8?B?V3N2ZVZUelE3VTJmQnVUTTNWM2prMlI4U2k1NXpwNU9aWHhCR1F5emZ0cGJX?=
 =?utf-8?B?bkFqbS9XK1NLWjhLZm1INkRGY3VTUXlobTJTbU13a3NFUjYzOHorZUV3Nkl2?=
 =?utf-8?B?dFh6eGFaWjF0UFdKazU3Kzgwa1ZMaEVuYSt5Y0F6bU8yS3VFMmhxZ2c5ZWRa?=
 =?utf-8?B?ZGxxWU5hUm94VHVuMEtzODlnS3hjZ3VOQnA1YVp1bkxNTTIwOWtRRHM3UUg2?=
 =?utf-8?B?alp2cThuejZsc2ZNa2FJME05NCtNMjQySjl4alBsVVRmMUVGOXRNK0xoTTdq?=
 =?utf-8?B?NkFwZWk3bFVnOC9JS0tLRjVLV2hJRk1TN1ZtZTVyQ0NzY3l4TTJDNk5WWmda?=
 =?utf-8?B?bkYwVVc0K3paZWhGSUdBbm9TYUd6alNHekN6ZllMRlBVNkZsVVRRRGtnRStT?=
 =?utf-8?B?K0ZCMHhCUnRCUXE1M3dIMlBVcThraGN6eWsrZkV6YWhwTDNxbEQycnJLZzhX?=
 =?utf-8?B?S0RIRWszODJWNVZwOHZCQ0xqV1QrbFllc3pyaFBvUGdId3REelZyaDdWcWNL?=
 =?utf-8?B?bFV0KzVkOHdIQURNSXFWYUFVWC9iUCtGa1Z2aG4yQ0R6Vk5XNWdCREx1dFgw?=
 =?utf-8?B?YmVWMTNmQ0tJNHVTeUphWS9vWlJxRUhaVDhMaXF1cjVINmlLNm5YKzNDelVV?=
 =?utf-8?B?STNHM1FQUGVualc0cnpMbXhtSk95OGc5WUpDeHpiYytEM1hLK0xqQU12TmIr?=
 =?utf-8?B?NUg5QlRDWDl3R0xYZXE3Z2VuL1hjMXRXdmFZdHBydHpkdGo2OVFVQWtPaU1U?=
 =?utf-8?B?cWlKOEppak9tbUZuYTZrMEo4OWY2YzBKekFUcFBjQkRNU0p1bkUway9BaG1y?=
 =?utf-8?B?cTJseDFsTCtISzZ3Tjg5QTgzVUNlaWQ1NWZUczc3bmhBQzdpK3FGZFUyVHRh?=
 =?utf-8?B?UjZXNVJ1Yk9YRGlOZy8yNkNlRDVpQTZFMk9xU0RGYVpndTUreGN4U2xuSkZP?=
 =?utf-8?B?OTdEN2ZSdUdlVDdyOEpNZ2dwbzV0RFMzNDByeVZITWYvZ0d1a1l1WVFpbXpW?=
 =?utf-8?B?YlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5eb98e-d3fa-4491-3530-08dc1d713177
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jan 2024 06:45:17.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M3ERm22Wm7NXw+6TFiACgPXYxe3C0M+pPo1glFVdwnPACbH1r25jqI4IXL+ew22oTRvDn0CSj3+KFFL5GMZaGPlItNbJFa0eQGm6W6t/dQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB8093

SGkgU2VyZ2V5IFNodHlseW92LA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZy
b206IFNlcmdleSBTaHR5bHlvdiA8cy5zaHR5bHlvdkBvbXAucnU+DQo+IFNlbnQ6IFdlZG5lc2Rh
eSwgSmFudWFyeSAyNCwgMjAyNCA4OjUxIFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0LW5l
eHQgMS8yXSByYXZiOiBBZGQgUnggY2hlY2tzdW0gb2ZmbG9hZCBzdXBwb3J0DQo+IA0KPiBPbiAx
LzI0LzI0IDExOjMxIEFNLCBCaWp1IERhcyB3cm90ZToNCj4gWy4uLl0NCj4gDQo+ID4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IEpha3ViIEtpY2luc2tpIDxrdWJhQGtl
cm5lbC5vcmc+DQo+ID4+IFNlbnQ6IFdlZG5lc2RheSwgSmFudWFyeSAyNCwgMjAyNCAxOjA5IEFN
DQo+ID4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV0LW5leHQgMS8yXSByYXZiOiBBZGQgUnggY2hl
Y2tzdW0gb2ZmbG9hZA0KPiA+PiBzdXBwb3J0DQo+ID4+DQo+ID4+IE9uIFR1ZSwgMjMgSmFuIDIw
MjQgMTU6MTk6MjMgKzAwMDAgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiArc3RhdGljIHZvaWQgcmF2
Yl9yeF9jc3VtX2diZXRoKHN0cnVjdCBza19idWZmICpza2IpIHsNCj4gPj4+ICsJX19zdW0xNiBj
c3VtX2lwX2hkciwgY3N1bV9wcm90bzsNCj4gPj4+ICsJdTggKmh3X2NzdW07DQo+ID4+PiArDQo+
ID4+PiArCS8qIFRoZSBoYXJkd2FyZSBjaGVja3N1bSBzdGF0dXMgaXMgY29udGFpbmVkIGluIHNp
emVvZihfX3N1bTE2KSAqDQo+ID4+PiArMg0KPiA+PiA9IDQNCj4gPj4+ICsJICogYnl0ZXMgYXBw
ZW5kZWQgdG8gcGFja2V0IGRhdGEuIEZpcnN0IDIgYnl0ZXMgaXMgaXAgaGVhZGVyIGNzdW0NCj4g
Pj4gYW5kDQo+ID4+PiArCSAqIGxhc3QgMiBieXRlcyBpcyBwcm90b2NvbCBjc3VtLg0KPiA+Pj4g
KwkgKi8NCj4gPj4+ICsJaWYgKHVubGlrZWx5KHNrYi0+bGVuIDwgc2l6ZW9mKF9fc3VtMTYpICog
MikpDQo+ID4+PiArCQlyZXR1cm47DQo+ID4+PiArDQo+ID4+PiArCWh3X2NzdW0gPSBza2JfdGFp
bF9wb2ludGVyKHNrYikgLSBzaXplb2YoX19zdW0xNik7DQo+ID4+PiArCWNzdW1fcHJvdG8gPSBj
c3VtX3VuZm9sZCgoX19mb3JjZQ0KPiA+Pj4gK19fc3VtMTYpZ2V0X3VuYWxpZ25lZF9sZTE2KGh3
X2NzdW0pKTsNCj4gPj4+ICsNCj4gPj4+ICsJaHdfY3N1bSAtPSBzaXplb2YoX19zdW0xNik7DQo+
ID4+PiArCWNzdW1faXBfaGRyID0gY3N1bV91bmZvbGQoKF9fZm9yY2UNCj4gPj4gX19zdW0xNiln
ZXRfdW5hbGlnbmVkX2xlMTYoaHdfY3N1bSkpOw0KPiA+Pj4gKwlza2JfdHJpbShza2IsIHNrYi0+
bGVuIC0gMiAqIHNpemVvZihfX3N1bTE2KSk7DQo+ID4+PiArDQo+ID4+PiArCS8qIFRPRE86IElQ
VjYgUnggY3N1bSAqLw0KPiA+Pj4gKwlpZiAoc2tiLT5wcm90b2NvbCA9PSBodG9ucyhFVEhfUF9J
UCkgJiYgY3N1bV9pcF9oZHIgPT0NCj4gPj4gVE9FX1JYX0NTVU1fT0sgJiYNCj4gPj4+ICsJICAg
IGNzdW1fcHJvdG8gPT0gVE9FX1JYX0NTVU1fT0spDQo+ID4+PiArCQkvKiBIYXJkd2FyZSB2YWxp
ZGF0ZWQgb3VyIGNoZWNrc3VtICovDQo+ID4+PiArCQlza2ItPmlwX3N1bW1lZCA9IENIRUNLU1VN
X1VOTkVDRVNTQVJZOyB9DQo+ID4+DQo+ID4+IHNwYXJzZSBkb2VzIG5vdCBzZWVtIHRvIGJlIG9u
Ym9hcmQ6DQo+ID4+DQo+ID4+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWlu
LmM6NzcxOjIwOiB3YXJuaW5nOiBpbmNvcnJlY3QNCj4gPj4gdHlwZSBpbiBhc3NpZ25tZW50IChk
aWZmZXJlbnQgYmFzZSB0eXBlcykNCj4gPj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9y
YXZiX21haW4uYzo3NzE6MjA6ICAgIGV4cGVjdGVkIHJlc3RyaWN0ZWQNCj4gPj4gX19zdW0xNiBb
dXNlcnR5cGVdIGNzdW1fcHJvdG8NCj4gPj4gZHJpdmVycy9uZXQvZXRoZXJuZXQvcmVuZXNhcy9y
YXZiX21haW4uYzo3NzE6MjA6ICAgIGdvdCByZXN0cmljdGVkDQo+IF9fd3N1bQ0KPiA+PiBkcml2
ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jOjc3NDoyMTogd2FybmluZzogaW5j
b3JyZWN0DQo+ID4+IHR5cGUgaW4gYXNzaWdubWVudCAoZGlmZmVyZW50IGJhc2UgdHlwZXMpDQo+
ID4+IGRyaXZlcnMvbmV0L2V0aGVybmV0L3JlbmVzYXMvcmF2Yl9tYWluLmM6Nzc0OjIxOiAgICBl
eHBlY3RlZCByZXN0cmljdGVkDQo+ID4+IF9fc3VtMTYgW3VzZXJ0eXBlXSBjc3VtX2lwX2hkcg0K
PiA+PiBkcml2ZXJzL25ldC9ldGhlcm5ldC9yZW5lc2FzL3JhdmJfbWFpbi5jOjc3NDoyMTogICAg
Z290IHJlc3RyaWN0ZWQNCj4gX193c3VtDQo+ID4NCj4gPiBJIGhhdmUgcmVwcm9kdWNlZCB0aGlz
IGlzc3VlIGFuZCB0aGUgd2FybmluZyBpcyBmaXhlZCBieSByZXBsYWNpbmcNCj4gPiBfX3N1bTE2
LT5fX3dzdW0uDQo+ID4NCj4gPiBJIHdpbGwgc2VuZCB2MiB3aXRoIHRoaXMgZml4Lg0KPiANCj4g
ICAgWW91IGNvdWxkIGhhdmUgd2FpdGVkIGZvciBteSByZXZpZXcuLi4NCg0KUGxlYXNlIHJldmll
dyB0aGUgbGF0ZXN0IHZlcnNpb24gdjJbMl0gYXMgaXQgaXMgZml4aW5nIGJvdCBlcnJvci4NCkl0
IGlzIHN0cmFpZ2h0IGZvcndhcmQsIGFuZCBzaW1wbGVyIHBhdGNoZXMgc2hvdWxkIGJlIGZhc3Qg
dG8gcmV2aWV3Lg0KDQpbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwMTI0MTAy
MTE1LjEzMjE1NC0xLWJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tLw0KDQpDaGVlcnMsDQpCaWp1
DQoNCj4gICAgRGF2ZSwgSmFrdWIsIHBsZWFzZSBkb24ndCBtZXJnZSB0aGVzZSBwYXRjaGVzIGJl
Zm9yZSBJIGhhdmUgYSBjaGFuY2UgdG8NCj4gcmV2aWV3IHRoZW0uIEknbSBvdmVyd2hlbG1lZCBi
eSByZXZpZXdzIChib3RoIGludGVybmFsIGFuZCBwdWJsaWMpDQo+IEFUTS4uLiA6LS8NCj4gDQo+
ID4gQ2hlZXJzLA0KPiA+IEJpanUNCj4gDQo+IE1CUiwgU2VyZ2V5DQo=

