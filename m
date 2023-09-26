Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F30D7AE8FB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 11:25:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbjIZJZa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 05:25:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233835AbjIZJZa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 05:25:30 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2135.outbound.protection.outlook.com [40.107.113.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9001DFB;
        Tue, 26 Sep 2023 02:25:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b3QiHgJ4O+mOwTf7lKoUg5j9tKX5tCpzIyUyNTXDCmqhUkGp9td87vB30Awhn9GQ3qPcm5a85l5eY9Fhg3uJsNhkm+/RRCldeAH0DpiCfOLqAI09qFGSamYQMkSLhFO55nguSJ6U7Hh2NRvvvcOmXoJWcI1qsakAgUS0x0eITA9PMNqiMQrMm1/rGbsVnBRYirMh8OJqi7j05pC2yqxteR+HdDlTylWTddHt9rvNKhpnwywzYfbnzaAZnENGZjPYv8PP2JTfGwHybR5ZEKuUgs4zEpcLUGnxnc0oH0aXpilE8c6IMOrx39kEs8EBu2x70yeUWrza3f836u6Ms5g8UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=agiedZTIqj8sQPnaTUOQ/WetCs+pzDtjty9p7QpDB6A=;
 b=UDOrZxMQn9qiGUfUyqvhnLet1DBADGiafKb4n9u3ShFmQNVnbILTPIA6+e4ygBPmgLi/oWSlpc4ltd2EjfTMckx6NKWPmPXySmuREQ+BVyqdoHSFPP/C1nKKWpEVJQ/wlVLod0EfqEc47iLR3+osjylm1gFnIBnOCmLOiP4O+7m+l1+TuwzKYqs4q4rUFe19qxmycxpBL9zaGeh3/1MNeWVf2ELJA+omc9wn+xblftM076RtM+0HdFQzDCVQcoq4UlbKNygn/Nk0oScVoiEGDfHFutOfcFH2PHHkBMxMaD/3tkjV2UxWFshfGdDzriiyMsiSltm1jokQHZM6BRe02g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=agiedZTIqj8sQPnaTUOQ/WetCs+pzDtjty9p7QpDB6A=;
 b=jo7lEKQ87/s+tfeG1E7ZK4kiDcmNoX72b+WwmD1Q3t+d+8UUHCSrncCIY5g2GBGVFw6Pje0940aM2sRo/CZIp7pAOm3OywpXQEzoA+/y5K2Nj9UewlOTEIodRxeqAffNnuie2qWYLopbUJhfLnNKbWAPV9998lvzXIZuTU+pTEs=
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by OS7PR01MB11869.jpnprd01.prod.outlook.com
 (2603:1096:604:236::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 09:25:20 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::1dc4:e923:9916:c0f7%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 09:25:19 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: RE: [PATCH net v2] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Topic: [PATCH net v2] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Thread-Index: AQHZ8FElvoQTR6IqdUqasM7u9/QEQ7As0o4AgAADODA=
Date:   Tue, 26 Sep 2023 09:25:19 +0000
Message-ID: <TYBPR01MB534169E4AFC0EEF5A1A50F89D8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20230926081156.3930074-1-yoshihiro.shimoda.uh@renesas.com>
 <5cffcbce-9521-e896-d2e2-93585e6068ee@omp.ru>
In-Reply-To: <5cffcbce-9521-e896-d2e2-93585e6068ee@omp.ru>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYBPR01MB5341:EE_|OS7PR01MB11869:EE_
x-ms-office365-filtering-correlation-id: 6dbafd6b-560f-4175-d48d-08dbbe7280c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RqsHVFTJfOrqu5bJowW9y1FILAfnnJpzkcQlbZQS8CaH97dB95XCbBGkIE9EPCLT0Wp8OpYeCFX3f2+KDkoGhFtdMPUXV4KDZhfzIAcnWyUsPRHQWg6IbbG0X/n2xhCRoKMb35VGcSp/SJRsYK0gtbDwjwDX9xBK0JWEO1UL+Jir2gmC5obrgYEhq7iDGuVCkpG6t6/SXmlf+l4/guXP+BDLjJRsLQ7Mrt/Z5tFQXZVzHr1JnKVbkm/jypjL9USnhOdXGzZPSKP8/5heEnmf9onyJ/Lz+b1uCkVJjlXPfVMQPU9GEwlbu2tM/QFAetakqdsXK/Tl+feGlwn13KhGqmDG1rgctNi/U+9K1r+y8j29EFcuDFD02TotU5bJWdGMaVhbhTwldwY1X/Si/mzmGIpg5mi3UDAnKJi7/DwJAHzjxuasnYl4oD5Liixhu+lYp1x3gsnDAOPe2+YLXRw1tpfKeiWF0VSIAxp/6To+neI9CQk7TLtU34EzZos55ZSwHJRJXKgVagFr32oh+sJKNtFArpC3epMSL9LrkHzWXmGon4iYt+51yk3551o+bOI9H/G+Xjd3njJ/Iuw/RMUF6Uh+LdpSe+CGKG9ITQWM/rXNOJN6Uq+zrSC42jBWyY3M
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230922051799003)(186009)(1800799009)(451199024)(122000001)(38070700005)(38100700002)(33656002)(86362001)(55016003)(52536014)(2906002)(478600001)(41300700001)(316002)(66556008)(54906003)(66476007)(76116006)(66946007)(64756008)(66446008)(110136005)(7696005)(71200400001)(6506007)(5660300002)(9686003)(107886003)(4326008)(8676002)(8936002)(53546011)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R3dJS3N2dVBDOUpXZ2sybnpHYmwxVnlNRnBmaWk4MVQreVJsZjB1QU13cmpP?=
 =?utf-8?B?NnBUVU9RN1cvOWkrYWUrSTFhYmV0QnliSlJCQUltbjlnMW1HeFl3U0dSdlpL?=
 =?utf-8?B?QllScktpY1JTYkRPNklHOURJcmdtUlhDbk9SdE9RL3NUOU02YnQxV0E2cldi?=
 =?utf-8?B?bzZZTjJRYjBEVzZKeWNwbHNtdExHSDF0UnBQblN0aVIydzFhWVdqRXN2aUZ5?=
 =?utf-8?B?MUFSUkJDeldBVGFwY1RWQWp6TGNlSHYyVXZBbzhlMlgraXdvZFRMYnA5L2hY?=
 =?utf-8?B?THVpNFFnREd6eEViWjZhaDZHcXZOZmJUMHN4UXowRk12cVMyUE9nSzlCQjl4?=
 =?utf-8?B?YTByWHpyOStDK0loa1RHOWVxQXRrSVZLS0o3ckYwdGRyaEprL0JYTUxOMlh5?=
 =?utf-8?B?YmNMMDhVTlVoUERBZmp5eGcyUmlHSWdsdHlpVW9kQWRLUU1HZTZSVXFPK1FU?=
 =?utf-8?B?b2RlaHZxTU13cjdIN2hkWVVHc0Vvang1bzdMOFZvQWcxYlVFWkEveVhveDZU?=
 =?utf-8?B?ZWJWMVRSV3NnVm9HQnhsV0VFekJjcnpIanc1OUx0Y1J0bUEvRExxRDh0ekpN?=
 =?utf-8?B?M04zVnZJNVUzdlVOeUlITWp4eHRYd0ZZcGVOblloWSs1cG4zbmN1TG1vMkcv?=
 =?utf-8?B?UHBQMmxybi9VR2F2MDlFQlZJRmNzMTEvUE40OUg2S3ltdmt0NWNjZnpxOUd2?=
 =?utf-8?B?Q1BDdVBqQ2N6K3VCWHlzYVRCaEh3eVNLWVBXdW14VVZGUS9HL0RZUHZ5blZ6?=
 =?utf-8?B?WWlkbEpFYnlMNFYxTHdXUXh1bU50TGc4Sjk3MFI2WlVjRE4zUm1ZV3NDRVhB?=
 =?utf-8?B?QXh6MFNMY3JuSGw4emhGV3RXaXZxR1FJMWhFY2tPOTcybHkxb3d1T0xJSmc4?=
 =?utf-8?B?UXo3S0pBVjBmWW9HTlZsU1R0cGwyZ3NQZWY0ejJKRVF0N0FSVXJ1akRsVk5T?=
 =?utf-8?B?U1o4V2pYUjkrOTQyK3FUMHdneGVtKzIwTG81QVEydnFuRGQrUVVQelZJMXFB?=
 =?utf-8?B?dU1US29UWUM4ak5EWE1oTlFjZzlMbFVWVjBFUE0rajRRQmlVNXBla2JTZEpH?=
 =?utf-8?B?YUE5bkpGSzBzZUVjbkJqWVV2K1RzR2pDcUpoTUx1a0NDU1lSeC9Gb3RPZFhn?=
 =?utf-8?B?SWhyWHM5Mm9BeU93SVk1TmVYcEdHZDRjbUVVQUVMTkpvdVAyeEErM3dCUDhQ?=
 =?utf-8?B?ODNEZWtnK015SkJlMXNEbVVqdXVsMEF5VGhmZTVMMWUzeTFrbW1DNHE3RTBy?=
 =?utf-8?B?L0ZoZ3NtNVQ4TC9pVmRHaDNsaGllR0I2NlJYMWV4NVprWFNQOXhkWWFyTElu?=
 =?utf-8?B?M3l2SkI3YUxucU43K2pyTmJCbFF0RlVPbUIzeS9zYXpCVlRpTlgwYWpPUG1s?=
 =?utf-8?B?aS90NmJIeHJ4WmdiKytrdnY5M0NwL05TOUVTbzhNVzVtd3J2MVpoVGQ2MVYv?=
 =?utf-8?B?WFV1b2ZBUHhtbFltdmlVTjhWTStOZVg3Yk51QTdCRzNZK0JDbFF6N3N5aVJ6?=
 =?utf-8?B?TTJ6d3JZdVZiK2kzOVJ1Vlp5MDB3MzRnT3pNeEp5bElvV3M0ZFhOUVZ5Y0lF?=
 =?utf-8?B?bFJSRVgyaitxN2dReVJ2UCszUmMyT01rSHU0V0UyaHdSRExPZUNSbHhlekdm?=
 =?utf-8?B?b2JrTlZUb3JhME1seUd5M2dDcTgyclJEUFRHWjFjWWVQcXR1OGd4VkQzbnhl?=
 =?utf-8?B?SitFdVhTVWM2THBhSHRvajJnSURraW9oSVl6UnFJL0VudW1VM2UxNTZWS0Vm?=
 =?utf-8?B?b1lZZjlUTXBHVFBRcStjU1lKb1BXS1d3RWx1emVoVXhhODhhdUkzSUxNWit5?=
 =?utf-8?B?RHVYZHRpWWNXRGs5NGdrQjhaWTlCN3pLaVptbW5Eb3lsUWtDT25uTlFOSFFZ?=
 =?utf-8?B?TFIzS1Fqd0VoRmZJNitRWFpGNFVTUm1ZNEFwMkROOUZSUW10M0FzbFc3TlhE?=
 =?utf-8?B?enV5ZmxRVlZyYWVIbzAxbkNCT3lyZVdkZ05IcGUvYktCeC84aEJ1WDltbGlF?=
 =?utf-8?B?UmdEZ0hPdjY1MG5LcVFIVDJQQ0FpQmJ1cDhTQlRsbkp6NTExa3dSZ3lSckVW?=
 =?utf-8?B?aG4vdmErd0d4b0libUx2WjF1UVJjbnNNRHVmaDVDZnBVUHduL2RZSzNtaDEr?=
 =?utf-8?B?VG9jQVVJbTdPaDN3cW9CQzhzaEtnblpxeDJ5Z2ZqR0V5WlNlR3dCenQ3c3A5?=
 =?utf-8?B?c0V4WE9XcTNkaUs1UFhsdjhhKzZhWEFCN3ZpMVNpemErR0JpYXhHTUxyWjlR?=
 =?utf-8?B?NUpwN3RoSWZKZ3h6TEl2VUFFQU9BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbafd6b-560f-4175-d48d-08dbbe7280c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2023 09:25:19.8472
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fVUdo9cjsmuL1KmR/9ECywq7FFST8+OMmpWMqBRo4n4wWaP6Tr+ErRfFBz7VpDg0pGQ6OFUfZPmcoJmZXnYMaGipzK5F0f4RZcItVxmfAgPU9O7evlUotLRmlz/8UKns
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11869
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGVsbG8gU2VyZ2V5LA0KDQo+IEZyb206IFNlcmdleSBTaHR5bHlvdiwgU2VudDogVHVlc2RheSwg
U2VwdGVtYmVyIDI2LCAyMDIzIDY6MTMgUE0NCj4gDQo+IEhlbGxvIQ0KPiANCj4gICAgWW91IG1p
c3NlZCBhIGNvbG9uIGFmdGVyIHJzd2l0Y2guDQoNCk9vcHMhIEknbGwgZml4IHRoaXMgb24gdjMu
DQoNCj4gICAgQW5kIGhpc3RvcmljYWxseSB3ZSB1c2VkIHNpbXBsZXIgcHJlZml4ZXMsIGxpa2Ug
anVzdCBzaF9ldGggb3IgcmF2Yi4uLg0KDQpJIHNlZS4gU28sIEknbGwgZml4IHRoZSBzdWJqZWN0
IGFzICJyc3dpdGNoOiBGaXggUEhZIHN0YXRpb24gbWFuYWdlbWVudCBjbG9jayBzZXR0aW5nIi4N
Cg0KQmVzdCByZWdhcmRzLA0KWW9zaGloaXJvIFNoaW1vZGENCg0KPiBPbiA5LzI2LzIzIDExOjEx
IEFNLCBZb3NoaWhpcm8gU2hpbW9kYSB3cm90ZToNCj4gDQo+ID4gRml4IHRoZSBNUElDLlBTTUNT
IHZhbHVlIGZvbGxvd2luZyB0aGUgcHJvZ3JhbW1pbmcgZXhhbXBsZSBpbiB0aGUNCj4gPiBzZWN0
aW9uIDYuNC4yIE1hbmFnZW1lbnQgRGF0YSBDbG9jayAoTURDKSBTZXR0aW5nLCBFdGhlcm5ldCBN
QUMgSVAsDQo+ID4gUzQgSGFyZHdhcmUgVXNlciBNYW51YWwgUmV2LjEuMDAuDQo+ID4NCj4gPiBU
aGUgdmFsdWUgaXMgY2FsY3VsYXRlZCBieQ0KPiA+ICAgICBNUElDLlBTTUNTID0gY2xrW01Iel0g
LyAoTURDIGZyZXF1ZW5jeVtNSHpdICogMikgLSAxDQo+ID4gd2l0aCB0aGUgaW5wdXQgY2xvY2sg
ZnJlcXVlbmN5IGZyb20gY2xrX2dldF9yYXRlKCkgYW5kIE1EQyBmcmVxdWVuY3kNCj4gPiBvZiAy
LjVNSHouIE90aGVyd2lzZSwgdGhpcyBkcml2ZXIgY2Fubm90IGNvbW11bmljYXRlIFBIWXMgb24g
dGhlIFItQ2FyDQo+ID4gUzQgU3RhcnRlciBLaXQgYm9hcmQuDQo+ID4NCj4gPiBGaXhlczogMzU5
MDkxOGI1ZDA3ICgibmV0OiBldGhlcm5ldDogcmVuZXNhczogQWRkIHN1cHBvcnQgZm9yICJFdGhl
cm5ldCBTd2l0Y2giIikNCj4gPiBSZXBvcnRlZC1ieTogVGFtIE5ndXllbiA8dGFtLm5ndXllbi54
YUByZW5lc2FzLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZb3NoaWhpcm8gU2hpbW9kYSA8eW9z
aGloaXJvLnNoaW1vZGEudWhAcmVuZXNhcy5jb20+DQo+ID4gVGVzdGVkLWJ5OiBLdW5pbm9yaSBN
b3JpbW90byA8a3VuaW5vcmkubW9yaW1vdG8uZ3hAcmVuZXNhcy5jb20+DQo+IFsuLi5dDQo+IA0K
PiBNQlIsIFNlcmdleQ0K
