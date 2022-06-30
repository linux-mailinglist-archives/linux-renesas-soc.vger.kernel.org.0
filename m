Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12E55561674
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jun 2022 11:36:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232959AbiF3Jgl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 Jun 2022 05:36:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234209AbiF3Jgk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Jun 2022 05:36:40 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2108.outbound.protection.outlook.com [40.107.114.108])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7200842EF2;
        Thu, 30 Jun 2022 02:36:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jscqwpRr31u0aOyU5+l/IpBAuExrRHCn44qdZ40YgyRkvQYoycivREQJhdT2vXb+ufgXpDa2mb/cAdoRjy9Z7eihHuMTlkSf0c7yuM/IGsvBTG0qjYlrqPlNAwUZ6yBBs1QnDETe5z0/6xMDJMao+anf8btziiZVY+rng/3WsVCpJ7sSVCErXe85lUqIyeXQHybnBno8oU8eCfxOUFj7rAYVFyhQjouB/gLVubgM4OBTfv1dxIE5Dx9Lkbij65WYplcpUfbxEXMVMWlNnKW+BmsQxz3f6FyZk5//nf5XjKATeyxKdVUSFd3yWl9jQQjtvWxiGJZO7JHHJO24CqUSLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1rMlRf92tIZ4IUAFKRw3IyZklyIxMYVuEbZPJvO0GA8=;
 b=bgM8ywy/GufLVLtUuwuCN+gRkxUDICipGFmXvbRDO+V/sdGb8NYuxGedPLFDrC37crzR9c+iaV/p0/gh5lXUdMWOQjbNuOpyzLKLvRNdYNGjnxHV7w42viojHasbJLrnM6OANLdGObOTGrGwUnYXu2fcAGseFW0NPYl85E8T8ZcGVC4Zy+brzEA2QcUX7XeMTdc8lSYlD3JrUZNz6V1NV3CLJ27SWBLj41YWyXdirAJU+DaaU6sGkuMWy+qG7ZUHsrhsL11dpBpzyLm0ZWeCVpcosT0ziVNxsG3NdBkdXZD6aaQ8gjRFN+YdxMz44qdJQuq1Jge9jY4KwMGbAaLuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1rMlRf92tIZ4IUAFKRw3IyZklyIxMYVuEbZPJvO0GA8=;
 b=h3tVQy+jweZD6dkjxcufipoACxTwkZR2riY408f9qH4q1ccWVVRKZrwY2mJYwdStVWUce5QUJd8Jorl3SGcRFyAnCydsUVT98COoNkEhDmTx0dq58Sp2nT184o68Nfmt/vUvhZLmKNRFuypZwYDl+xfNJvKG5gbdrXRCpmVj7u4=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYAPR01MB6124.jpnprd01.prod.outlook.com (2603:1096:402:30::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 09:36:36 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 09:36:36 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Johan Hovold <johan@kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Topic: [PATCH] serial: 8250: dw: Fix the macro
 RZN1_UART_xDMACR_8_WORD_BURST
Thread-Index: AQHYjFzibZDpSeuY/0G2TScEFUYXP61nsJpg
Date:   Thu, 30 Jun 2022 09:36:36 +0000
Message-ID: <TYYPR01MB7086606AAF4ACE39ADBC0140F5BA9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220630083909.4294-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4c03202-5ebd-45a4-4ff6-08da5a7c06b5
x-ms-traffictypediagnostic: TYAPR01MB6124:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G2FeV+UsQpkvoAZYo8/9C1A6Zfeyy5NKcRzBCv+r6YE2uP/64koMSzBTzKkSHhVarXMeM93cppj6vX9Rs+Z0I4fqxPLh4xlkWh1RGdL+SXoCEJF3fzmpMJg0ktZOp4MS2CJTh4juykXnvbSr7HFXh8SKjajm7AEf0loLWnnEKMIl1FQ+4mY+QuN6iM02GGv2XyL7GMvoWjLBXrxX+7AlrzDj8rrSQXs901YqqlatcUknWfaOhI9+QD5Ehuhb/nHMfe3XEPU9cJwVBQpsHgjLOuMXZ18zvtQJlnrUSyN3awLoGfA7HRsLfNxmf0n9InbWYQ0z71jaqH+hawBz79qgR7yeeve/xSeqp813XrDnUvyyLbn9J5xR7CXSWkK+foSWqqSrOpUdt1afrV1liIxLRBJ7gsY88buxA3VXUdjRL5UeTFGksnK9YnQC4Ss0cfJN/F3COd8X8IxmYlvbQiw1hfViZmnS9LrUvpeXLcjRJcMHXOSxG3kWJC1mH6hdw59F2oTtSCZDxSEDia6PxZxsbfOcv4SS4iqJosNiV+ktW3dCO/ZXIrpzcVMbQd0GnqjW5jYotv0w1tEkBmKIhsmEI1yAlfhL0/NeFSH+aHCUkFanD7esVhH8N3uvSE9zFwWX9HveWFD6IuCEeJHAFpTuAQsSJNc3c/6rrkTMaveZnJCTtaqCweAs5jIH8p10yPjSoVgcSXgzWsoQ1cR/JTXW955KghEoKGNfK3G+HHA5FG4sl29i1scD6Xk1HKadafiuK59tYwWuFGDkV/D1yOFxUE3eu7UGflZRXmbO4CYt1V4gSwXIA0vDS4YH3vi4gdYb
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(7696005)(53546011)(83380400001)(4326008)(6506007)(316002)(478600001)(76116006)(186003)(2906002)(44832011)(8676002)(55016003)(33656002)(41300700001)(9686003)(26005)(86362001)(8936002)(52536014)(38070700005)(71200400001)(66946007)(66446008)(66476007)(64756008)(66556008)(38100700002)(54906003)(5660300002)(110136005)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkF0TXltRWRjbmM0NHBsVk10d3phamQ1NG1aMU1LVDJjNFlhbURGUWcvbll2?=
 =?utf-8?B?QlV3dDBtZUZvZzFqVGpkbTc4emVwUHNjcTNvQjRMV0tVWStDcFA5ZzcvWDVC?=
 =?utf-8?B?TlpLdjVPd2JYdXM0bWVPb0hlSjZ6cmZ2QXJBdmgya0h1L2Jtc0pldi9qM0I0?=
 =?utf-8?B?VG5iVCtOZ2Q5ZHZVUG5zQU9yeFMrYWQ3T0xRUXBtYmx5TktSVmhhczZnOG0z?=
 =?utf-8?B?WmpwY016RFBvc1ZkRDh5bWo1alBWeGxhNWt4NXZmRFM1TmU1Z2QyMDVSYkNj?=
 =?utf-8?B?R01jQ3BPVXBpdUc5K1pLWnVxVk1rUDc5aEhHMElMS3I5Zmh0Q08zclZUMXY4?=
 =?utf-8?B?ejVLeUsxT1RLbnFTYXZqYjhDYVVGNWVaLzRFcEpONXVIUzQwMTRVRGpVVlVO?=
 =?utf-8?B?cGppNUpGZ3BHNjhIZFFvNlRZUm5YRXJ2bUh0Qkdwa2V1OFhmM2swUnRwNWRB?=
 =?utf-8?B?am1ldFRQQ2tCZWxHd0JJT3FJd0NxTGlPSWFYL09ibk5ha2JjaVpsZ1VNRkJ6?=
 =?utf-8?B?SHNjblBGZ2w1ZFlxUHVjQm9oaE8vTzZKS1BOamRJalJjWHBXUVRiQzBPNk5Y?=
 =?utf-8?B?d0cxQ2w2b1hqTFhyU2FCTmFqd2lUOUptNkc2VTlpTHh6b0VCZk1PWlBFbjN5?=
 =?utf-8?B?SXhFNVhTditHNjcwcHdXY1BsdG1PNXRwKzMzSEdEdk9GWUpvK3BOeWozYlRz?=
 =?utf-8?B?aHJ2SmNNSTlOK1RCSWdSNmlyekNiY3MzclZwUVIrdFYzNDBLVEhvZ1A5WnVH?=
 =?utf-8?B?Sm1LeitNbDFEZkRpOWQxYWFuWjJnUnc0RTk2ei9mZEF1cnQ4Q2tnMTRnOThq?=
 =?utf-8?B?bW44c3A3UVpXNFh2MFRaalVyVW5sMndhOWRsQ3NRZm5Gcm1VOHUwVWFHLzQz?=
 =?utf-8?B?MExmUEVKQkpEdGgvaEgwRGMxMUU3UXVUcU10Q3RxLzhnK2VBblJvcGJjS1Ex?=
 =?utf-8?B?UmVRTkx4eFNKVlcvdTlkWlFRM1I1dXdYQkRKZmkvNGl0WVdtbysxWG9mWEdv?=
 =?utf-8?B?TU1VQ25hK3RLTVp0elVGOHpTM0FtYmpGNVN5MGJJNjBCeHcrMTNHQ0U5ZmVT?=
 =?utf-8?B?TzBGK1ZzcFdtaVZCOWh6dnhxVVV2Rm1XSGR6UEh1aWhlRnVtVldxQzUvN3Iw?=
 =?utf-8?B?amZ1UWh5S25QTFBkWTdPbmtGRk56M0RHZVZnSnBkSzQvMVhWYlhucUVEc2tC?=
 =?utf-8?B?TzR1ZE9GZGNVU09EWU5HQWtxYStuckNkYWU4MWxqbloycHE5NkFoNGMwUkZP?=
 =?utf-8?B?ajF6V013TU80NTR6VXpGYzI2eTNEZmszTTlHbnpPcUNpTm9WcHhKRFdqNXVP?=
 =?utf-8?B?RE1yYU00QVl3ZEN3MTh3aGJmU0RGOExOUW9PQ0lOb3FpUVVLQWNaNWxIbDNu?=
 =?utf-8?B?N3ArSWVMbmNlZ01ZT05qNVM2RUxLNml4UGtDWml2ckRRclAyN3hoeWFKaEJm?=
 =?utf-8?B?MmlhdVZ2bDhwQmxLTU9FUDVZM3hJcTB1b0lPUGtwNWxYUzB3QlhNUGQ3Z2Nz?=
 =?utf-8?B?VTMyTThxZ2xsWlR4bHdEblNPNEZNTm1vQ1hSVEZkc0k5YVpxbTlSVlM1bTBG?=
 =?utf-8?B?OFZ1Qld3djRDeVdaUGJmMVo4VUpweE11UVFsWU1nZDkySCtKTllNNjNOdTN1?=
 =?utf-8?B?YzJtV25FWUY1bXJkcFE2ZGZXN29ZWEF0MkEzWVhXMk51eEtHWTA0T3l2SmZj?=
 =?utf-8?B?MWhUc24xc3JDL1Njd2tqVWx0am1ZSEhoZEUybUJXV1R4blA0cldiUTdUM2Ns?=
 =?utf-8?B?V2poVjFJWGgyYVZnS0V5NmFkT2RwN1hndXgzTDJIUWJJMEZuZGZRUURiQkp0?=
 =?utf-8?B?aFpoWEpyeW42L0tMdXVJZ0xWUFhaVXhLSUNVK05LQVpvQXY0TnFRYU0rYURs?=
 =?utf-8?B?eEJ0bHVuWGdzcXFLYk1aaDZUMCt5QURUcEJOVElxdTRPNWlYTllGSWIrTE9h?=
 =?utf-8?B?WCtLRFVwT1dOTWtFVU42WXFWZzF5RGcwVnV2T2xPVW9oNHRNREtOVXRyWnNY?=
 =?utf-8?B?VWVIOTNTQStMUW5pMjBMMVJXaUNsVmRwTW5MOU8wMFJFMWpTUW12dG44UXFK?=
 =?utf-8?B?YXFKOVlVWVY1WHFxRm43U2dyNmFzZ0QrTmlsMnlVYnMrQXV3YVY1dDZzeEpL?=
 =?utf-8?Q?C3DhFuHXQvFGqCrReL0gs1UwF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4c03202-5ebd-45a4-4ff6-08da5a7c06b5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 09:36:36.1180
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbG32fYhYQ5T/sOeKgWxf5ZNiD5trwadihXmMbJ6TjiapBpy/bWumfZZygPHE1PVOm7F4nvSeAz3K17ssCBEICzoNhSQI9fsa03E5h+qWNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6124
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgQmlqdSwNCg0KT24gMzAgSnVuZSAyMDIyIDA5OjM5IEJpanUgRGFzIHdyb3RlOg0KPiBBcyBw
ZXIgUlovTjEgcGVyaXBoZXJhbCB1c2VyIG1hbnVhbChyMDF1aDA3NTJlajAxMDAtcnpuMS1wZXJp
cGhlcmFsLnBkZikNCj4gcmV2IDEuMC4wIE1hciwyMDE5LCB0aGUgdmFsdWUgZm9yIDhfV09SRF9C
VVJTVCBpcyA0KGIyLGIxPTLigJliMTApLg0KPiANCj4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgbWFj
cm8gYXMgcGVyIHRoZSB1c2VyIG1hbnVhbC4NCj4gDQo+IEZpeGVzOiBhYTYzZDc4NmNlYTIgKCJz
ZXJpYWw6IDgyNTA6IGR3OiBBZGQgc3VwcG9ydCBmb3IgRE1BIGZsb3cNCj4gY29udHJvbGxpbmcg
ZGV2aWNlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NClJldmlld2VkLWJ5OiBQaGlsIEVkd29ydGh5IDxwaGlsLmVkd29ydGh5QHJlbmVz
YXMuY29tPg0KDQo+IC0tLQ0KPiAgZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+IGIv
ZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+IGluZGV4IGY1N2JiZDMyZWYxMS4u
OTMxNDkwYjI3ZDZiIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3R0eS9zZXJpYWwvODI1MC84MjUw
X2R3LmMNCj4gKysrIGIvZHJpdmVycy90dHkvc2VyaWFsLzgyNTAvODI1MF9kdy5jDQo+IEBAIC00
Nyw3ICs0Nyw3IEBADQo+ICAjZGVmaW5lIFJaTjFfVUFSVF94RE1BQ1JfRE1BX0VOCQlCSVQoMCkN
Cj4gICNkZWZpbmUgUlpOMV9VQVJUX3hETUFDUl8xX1dPUkRfQlVSU1QJKDAgPDwgMSkNCj4gICNk
ZWZpbmUgUlpOMV9VQVJUX3hETUFDUl80X1dPUkRfQlVSU1QJKDEgPDwgMSkNCj4gLSNkZWZpbmUg
UlpOMV9VQVJUX3hETUFDUl84X1dPUkRfQlVSU1QJKDMgPDwgMSkNCj4gKyNkZWZpbmUgUlpOMV9V
QVJUX3hETUFDUl84X1dPUkRfQlVSU1QJKDIgPDwgMSkNCj4gICNkZWZpbmUgUlpOMV9VQVJUX3hE
TUFDUl9CTEtfU1ooeCkJKCh4KSA8PCAzKQ0KPiANCj4gIC8qIFF1aXJrcyAqLw0KPiAtLQ0KPiAy
LjI1LjENCg0KVGhhbmtzDQpQaGlsDQo=
