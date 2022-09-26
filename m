Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 939DD5EA880
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234918AbiIZOf2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:35:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234376AbiIZOec (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:34:32 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28F598276D;
        Mon, 26 Sep 2022 05:52:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vc5vrI0hfhbMSSCMZ1Q1ZEfO0D11eHLKaAwe/4UAPWtHsd6u8t4bwXGwP6ybBESoyvLNQhoZc8QNJTzSvpQ52C/uoNcH3j4Tn/uWPOzcaOqCZvhY/TD/MWdy4NlGGtod95w+s7+UGK0QvDvGlzytC30DHA2nLArCwMqb+4r58XniCihZILHRJTeOnwAvsLlw3Qz0bZ2BFaIvNaIi1LyPZEAxnYZHWwi4EuVJlnzd9mQtFph1KuxhRzPeZ+uvfNLQ2I2Y08PEEvwRuT35orfZr4tbfSdRGYyQcLfGDhXGdZKzY6Fdvb+SJuraliy7o+s3grhMJaWQdcrwdAZ+VjYSOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cr5vuCOhoMJnZL0N2Ru19aQ8EodWhV7RmAv2kJV6EM4=;
 b=ilG6kQmjU9/OkAvAo+qzCcZAocDuiK2iE2dEqZEZcOTDJvguHyWqUnV8sd8hOt73yeI1Kkvj8Qc7bqCAbUwUoGU0DvHDZeXQuOZI3XubvG30UFEObRvG7gSseUvbS37wi//XfAdQn9cSgU8bgcFeGnzULPIvb+KYw98zo3b9ML5F1WC8bzGLt0vpol7r74BR5QpBpav55sRNmAtbrAMRSeavdYmZlK87W1U2Q+63gz4T1OakwTrIi5njbY14zsjGLq5poTXcfc/7+W0SPiOJR8rWWEgth+NpSbnXk9QtgBc5CnJERppT+0kgINgUIhrwQFkE+r/YkO2Y8elwwS6uDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cr5vuCOhoMJnZL0N2Ru19aQ8EodWhV7RmAv2kJV6EM4=;
 b=nwIF3u1PdPbHdMGYR4H8t1aifKtB92eB0YUv180fN2TyicRehnZazV8bBTy9QdJfYcn7et6p0O8akaJeWK1ms3aKFJoPhLw9VQmohmqRJ771JlNP1d49yy9nHObDAiujfPoeKXlYXatmvXr9KvIuaYgswA/VIbPJmsC2BLw2Bds=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS3PR01MB6182.jpnprd01.prod.outlook.com (2603:1096:604:d7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 12:52:27 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::7c12:d63c:a151:92bc%9]) with mapi id 15.20.5654.024; Mon, 26 Sep 2022
 12:52:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Topic: [PATCH v3] mmc: renesas_sdhi: Fix rounding errors
Thread-Index: AQHYzmEL8L/KEMB8n02YNi6lLAt7563uYTMAgAIBePCAAUVNgIAACH3w
Date:   Mon, 26 Sep 2022 12:52:27 +0000
Message-ID: <TYCPR01MB5933EC322C8A9ADBF1C245C386529@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20220922085511.1078256-1-biju.das.jz@bp.renesas.com>
 <Yy7ZcJ8h2VCtUDnW@shikoro>
 <TYCPR01MB5933319E9510B176644D2BC986539@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdX0DJidfmjcKiDNm=82=cSLYRso+Kuq9HDxRCoubjHvsA@mail.gmail.com>
In-Reply-To: <CAMuHMdX0DJidfmjcKiDNm=82=cSLYRso+Kuq9HDxRCoubjHvsA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS3PR01MB6182:EE_
x-ms-office365-filtering-correlation-id: a72d789d-54cd-4757-14b0-08da9fbdf74e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: N5SlC00owin1rwNxYdyEdpOje4SSo4PLjIoQRj5D0BRWFQ3c5wBg7wX050iaKTgG08Z4xjfDGeDMmnQ6dPp8/vTcAPnaEDbyU/ITjAkoRsCsaen0D1nq9jdKZTakLUqdf5BzLpcN82vZTksNL6wCgj9yM/IjYNy5rhDFN01ZJmgIQV+3TFCNyEu1b65AHiqL33fXT9tQH+TbUwBXDmsxUVsGMVfpsU32f3LqrLZqHOgyZxc76e+SuLc9U/vr+1rpG+gdEn4HYlq00HqpHhHneu1YDLJ+cNwxz1oCdQOsl1AUstb5iK5eS1X/dA62PLX2g/jdNQc5KORnZy4N8vTW9+udDaHwIokenk0dGQQRw4rb8K2DuPMiezjyI6D0adGPpit3tTN45JAtVBmI73jb5m7FckZmGx6EBKfbNZpxNAe+LnaMm1Y5Q42Ott9GVQvBHP9ctDG/F50d1M++AEfPjUq6fE76dpnomfo0twqKvRRPRVA3Dt57rZnZJGCja4QvxJgWgrUfYjS4QbSIDKB5akc9ro64IwBoF7l8FNbrs1zEVSJKteVGr8GADrS6suSaD1JfJLJ+cpjnvggBQ86rVsVpg7P7f7yz2eCM5FBxf2ERQFc5EvoSll8EwKi3s0v8s3JXoKT8UrdwjaBdvWn9VoKd0uJ0carPdeeZM3qx1iHI8TpT7oQvpvF7G9I4G4X1oOTAtdioKJg6cG4XwTyOn6oGcTRaq/KxrMWrX7RnMw66L4XoRIbWvUjA2VhHn6VJu+j156e3bTTgfM3r3AGLyw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(451199015)(86362001)(38100700002)(38070700005)(33656002)(122000001)(2906002)(186003)(5660300002)(26005)(55016003)(107886003)(478600001)(41300700001)(71200400001)(53546011)(7696005)(6506007)(9686003)(83380400001)(316002)(54906003)(6916009)(52536014)(64756008)(8676002)(4326008)(76116006)(66446008)(8936002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWZlWmN6Ly9DS0IrNUxsUkRIeENtVzE3TW10VUdFYW1yYTRsRkRGODMwS2o4?=
 =?utf-8?B?VzV1NUs0R00zYURZREZ2VTBvcXVyelo3cjdZMDNGOUlWOUdYc3JyMXR1YjRL?=
 =?utf-8?B?bjU2SGxxZEtnQlI0OG15RitCRFZaKytYUkdSR3JJd1c1eGlEM3pySEc0dmgx?=
 =?utf-8?B?YVNqM05MN1dIMzhlZGVMbTcwOVU5bVJZYlhUazRMOXdqZkg1OVFoaHcwQUN3?=
 =?utf-8?B?eHVPNEh3YVEvdXNHY1NiNnFPQzg0YzZmOHBUR0R2ZzcxNGxHcURPbld5NkJk?=
 =?utf-8?B?QzFOT3g3M2ZWdUhFT3dOcHZoWloxa2M0U0pJcFAvTW9aY0c3VGFNa1c3aGc4?=
 =?utf-8?B?S2lXUGc0akRzY2o5RDFJbTVpRzY0OXlLRU9xRURna2p3TDNnQVBiRE0rZUI5?=
 =?utf-8?B?QnI1LzNySHNCN3A3RVQ0WXNTYzByb1BKREVJZkdOT0I1MTVOWmE5WjVsNk5R?=
 =?utf-8?B?d1pxSWIrMk5aSW80WE5mV1ZOWmpsYWIyV3VNWU81Q3NNL3ZhQ00wMC9MdWNx?=
 =?utf-8?B?a1lhMEF4c1lXSW9IWnAwSG5NN3hkbHg5bWZWd2JIclJhTjlWWjhvWVh3aVZG?=
 =?utf-8?B?K2FLbVhrSmFEUWFLRlB3MDdtazdJSCsva3ZIQXVaS1hpYlBzN0ZOYTdWMHV6?=
 =?utf-8?B?eFZLTU1jZjFyZEQyUnhuRkVFTEltK09NVlZLME83WXhHY2lkZlZ4d1BGaTZq?=
 =?utf-8?B?OHBwdVRYOWg0SG0vSktiQmdKU3FjWGlnZG8zOHoyYzRNcVkyMUEzejhXSWFn?=
 =?utf-8?B?MDhqTXpiWXFlWUZYbndkSW1FR1JjUmgrWW84TlVwaGdrUjZydndMV0VYUXd6?=
 =?utf-8?B?K2VkdEc3YUJKWFFsT0ZkN1FzR01jamNSdUdzdzNwazJQODgwNUg3cmpiaFA5?=
 =?utf-8?B?cHhCeFhhMjV2UXhCN1NSeWNIVStqZlIrRWY5eTlRdkp6WGVleFVXUTlVaU5W?=
 =?utf-8?B?RXprMEt2bjR1KzBxeVdlZVd4TkI4ekFMalF3WndZRHB5ckJzbGVLK1p1YzdW?=
 =?utf-8?B?ZEp4TTlObldtd1FhNXpLNy9nSkRZTnBYbVhhWHJmN1ZpcXl1c2FvejM2MGZ0?=
 =?utf-8?B?UVJiMjBWcE13STh5eFRKNnZ5aFAvZGRSaEREeTA1L2dVV2NaOEVydVRldTVa?=
 =?utf-8?B?dE51QVNPckh4Mm1lVjF4bHIvTElmVEYrUTFDa3lYMXRVUHN6U3I1OTVvSDJa?=
 =?utf-8?B?UGRVaE5Qd2NyTURwd1pRdHFJWURCQWhrZ0c5U0ttNS82MFBQZE5CWDlzSW9Q?=
 =?utf-8?B?ek1sLy9JZlNjQ1AwaDJMUjBaYTFUMGZOQlR1cU5qN05QeTJWZkJPVVpyTnZM?=
 =?utf-8?B?MzRHVUhyd2R1VTFNNXZTUlBCZmdFQVdJQ2lMTnJKdGFFY0VXQzJzQmZXdDRs?=
 =?utf-8?B?VS9udzM1aHBaOGkyUlM5ZzlnYXR2UVpJQnM1bkZiL0JTaTRQcjBrYnZmMCtT?=
 =?utf-8?B?NXlOVi85dmVuRGxhR21IVlowUXZMbXBKRlpVdUNzNlZ4UHB4cFJJTFZuaFdF?=
 =?utf-8?B?Z0owcDZVY2wrOStNWDYxbVA4RjZPNWhIMWI5Y3dqblAvN1VmVjlJK2UwMDI1?=
 =?utf-8?B?d0dJQ21lS01MRVREVFRqbTlhWHg5dEdhRE5HdVlWZlU1TEZxaEkzekFNV0c5?=
 =?utf-8?B?ZUxWOW1Ubmh0U3lmOXhxOTdjWFR4eGJzc0NtcTlhallaUDk0aTc0aDRMVzJh?=
 =?utf-8?B?d1NyKzVqVlg3OFZTa0UyVEpZazhHY2hjaDF1clpWcnZQMkI5dXdLeGVpUGpa?=
 =?utf-8?B?bDloNlpGUDJ1T09rdk1vclpzT2RxanNYc0U4MjhWaDF4UXhaaGtNQ2VhU3JZ?=
 =?utf-8?B?Z3AvNFJZRTJhME5Cd2V3VStKTStIdUQ1VXJzcmZud0Z0TEo1S0FDN2Q5Sk5X?=
 =?utf-8?B?Z0hQQm8zRnMraC9PcldwUDlVMnRkVEozQ2hSdkpJU3RMaThmY2JBWlFCb1pV?=
 =?utf-8?B?YktLMWg5NmoxUXQxUlc2RnRXNGFkUG1UMUxzYlpjTDgra211aW9mMnlhM2NT?=
 =?utf-8?B?VDFxSXQ3ajNjMVZGeEsvcjVPeHM5Vnl5ZmcvQjZwejI0T1c1MFdaTnkvK1lr?=
 =?utf-8?B?M3lRZjdTNzJrRjhaUmxWMGUwM2dzNDZuTzlMYUcvMzQxdjBzYXF0R1QxcHJa?=
 =?utf-8?Q?a54Os2bM+DDMOjMM08GubDziw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a72d789d-54cd-4757-14b0-08da9fbdf74e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2022 12:52:27.2446
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FfQsHtvZPwppzhyOx7w5GrWq2o6xAoTiLiTEkaMDG5LmlB0lfkNIL4dm0Nz2wD85fCt+lsRG1fLV8+/+ZliHFRgEy+UtEFsQNf0SKE+jR9I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6182
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjNdIG1tYzogcmVuZXNhc19zZGhpOiBGaXggcm91bmRpbmcgZXJyb3JzDQo+IA0KPiBI
aSBCaWp1LA0KPiANCj4gT24gU3VuLCBTZXAgMjUsIDIwMjIgYXQgNzowNiBQTSBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+ID4gU3ViamVjdDogUmU6
IFtQQVRDSCB2M10gbW1jOiByZW5lc2FzX3NkaGk6IEZpeCByb3VuZGluZyBlcnJvcnMNCj4gDQo+
ID4gPiA+IHYyLT52MzoNCj4gPiA+ID4gICogUmVuYW1lZCB0aGUgdmFyaWFibGUgbmV3X2Nsb2Nr
X21hcmdpbi0+bmV3X3VwcGVyX2xpbWl0IGluDQo+ID4gPiByZW5lc2FzX3NkaGlfY2xrXw0KPiA+
ID4gPiAgICB1cGRhdGUoKQ0KPiA+ID4gPiAgKiBNb3ZlZCBzZXR0aW5nIG9mIG5ld191cHBlcl9s
aW1pdCBvdXRzaWRlIGZvciBsb29wLg0KPiA+ID4gPiAgKiBVcGRhdGVkIHRoZSBjb21tZW50IHNl
Y3Rpb24gdG8gbWVudGlvbiB0aGUgcm91bmRpbmcgZXJyb3JzDQo+IGFuZA0KPiA+ID4gbWVyZ2Vk
IHdpdGgNCj4gPiA+ID4gICAgZXhpc3RpbmcgY29tbWVudCBvdXQgc2lkZSB0aGUgZm9yIGxvb3Au
DQo+ID4gPiA+ICAqIFVwZGF0ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiA+ID4NCj4gPiA+IEkg
cmVhbGx5IGxpa2UgdGhlIG5ldyB2YXJpYWJsZSBuYW1lcy4NCj4gPiA+DQo+ID4gPiA+ICsgICAg
KiBUbyBmaXggcm91bmRpbmcgZXJyb3JzLCBlZzotICg1MzMzMzMzMzMgSHogLyA0ICogNCA9DQo+
ID4gPiA+ICsgNTMzMzMzMzMyDQo+ID4gPiBIeg0KPiA+ID4gPiArPA0KPiA+ID4NCj4gPiA+IChX
aGF0IGlzIHRoZSAnLScgYWZ0ZXIgJ2VnOicgZm9yPykNCj4gPg0KPiA+IFJlZ2FyZGluZyAnZWc6
LScsIEkgZ290IHRoaXMgaGFiaXQgZnJvbSBzY2hvb2wgZGF5cy4gT24gZXhhbXMsIEkNCj4gPiB1
c3VhbGx5IHdyaXRlIGZvciBlZzotIHRvIHByb3ZpZGUgc29tZSBleGFtcGxlcy4NCj4gPg0KPiA+
IE9LLCBXaWxsIHJlbW92ZSAnLScgYWZ0ZXIgJ2VnOicuDQo+ID4NCj4gPiA+DQo+ID4gPiA+ICsg
ICAgKiA1MzMzMzMzMzMgSHopIGFkZCBhbiB1cHBlciBsaW1pdCBvZiAxLzEwMjQgcmF0ZSBoaWdo
ZXIgdG8NCj4gPiA+ID4gKyB0aGUNCj4gPiA+IGNsb2NrDQo+ID4gPiA+ICsgICAgKiByYXRlLg0K
PiA+ID4NCj4gPiA+IEkga25vdyBHZWVydCBzdWdnZXNndGVkIHRoaXMuIEkgdGhpbmssIGhvd2V2
ZXIsIHRoaXMgZGVzY3JpcHRpb24NCj4gaXMNCj4gPiA+IHRvbyBzaG9ydC4gSXQgc2hvdWxkIGJl
IG1lbnRpb25lZCBJTUhPIHRoYXQgdGhpcyByb3VuZGluZyBlcnJvcg0KPiBjYW4NCj4gPiA+IGxl
YWQgdG8gdGhlIHNlbGVjdGlvbiBvZiBhIGNsb2NrIHdoaWNoIGlzIHdheSBvZmYgKHRoZSA0MDBN
SHoNCj4gb25lKS4NCj4gPiA+IEkgbGlrZWQgdGhpcyBleGFtcGxlIGZyb20gdjIuIEdlZXJ0LCB3
aGF0IGRvIHlvdSBzYXk/DQo+ID4NCj4gPiBZZXMsIEkgY2FuIHB1dCBiYWNrIHRoZSByZWFsIGV4
YW1wbGUgZnJvbSB2MiwgaWYgdGhhdCBpcyB1c2VmdWwuDQo+ID4gNTMzTUh6LT40MDAgTUh6IGlz
IGEgYmlnIGp1bXAgZHVlIHRvIHRoaXMgcm91bmRpbmcgZXJyb3IgYW5kIGl0IGhhcw0KPiA+IGlt
cGFjdGVkIHRoZSBwZXJmb3JtYW5jZS4NCj4gPg0KPiA+IFdhaXRpbmcgZm9yIEdlZXJ0J3MgZmVl
ZGJhY2suDQo+IA0KPiBJIGFncmVlIHdpdGggV29sZnJhbS4NCg0KT0ssIFdpbGwgYWRkIGV4YW1w
bGUgYWxvbmcgd2l0aCBUZXN0ZWQtYnkgdGFnIGZyb20gV29sZnJhbS4NCg0KPiBJJ2xsIGdpdmUg
eW91ciBwYXRjaCBhIHRyeSBvbiBteSBjb2xsZWN0aXZlIHRvbW9ycm93Lg0KDQpUaGFuayB5b3Uu
DQoNCkNoZWVycywNCkJpanUNCg==
