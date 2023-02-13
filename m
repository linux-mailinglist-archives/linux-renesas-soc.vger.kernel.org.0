Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAD26694147
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:33:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230055AbjBMJdq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:33:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229944AbjBMJdY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:33:24 -0500
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2096.outbound.protection.outlook.com [40.107.117.96])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC0919696;
        Mon, 13 Feb 2023 01:31:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USmpFwfSI/gyAHfiBvE1Rjlf4xUa8KpkPFcsVD8rt23J1KKp9RrvYDGUfiJEPjqN37GpWksv2QcIYBgv9L/q0sn+VWm7+hApF/imwaKAmOFXdkYuMEXZGD/tOSP6baKEIL8XLEqEzaJltp5QPYiuDiVzS9Oq3QhWQmtMj9udUKsEFjzBjAmZURRFShqfUvffr8qDeVJ+x8f6YEkE/fDYdIC9KByXrr78E800NB7zkjAxS1CBXkeLCZJB/s4suLveJLoEtWxnCyZqbttD+cw0x5THwMaddANz6Xada6gf8XgQABN7HAgXQywvVXMacKLatB2TzTzWPy9a3e7XE2jhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFXD4HqeVOBRsDIUjnbGlgnol0XrzGsCIxG2g7FzfFo=;
 b=euSyH4/iGFKiofxq+MCroswo7xaqg6IoeQ0eaVd9tdXW9LWsQexeRTAcWy0DBUWDKe0YFALZnyjYxYa92JdVT4Nw19amfdcZOEMLdVdM4dJ1IbS949aUWGpN2wlGyB83HusZefiNxIm0aVx8DHYAtCG+8uwmUjLqZ8LbVwotGc9sstKikBntTdw+8Lwq1Qsk3M6TuWWy/GRHWphB75gjPneL0BC2DYAG5cfTooNwLkl4kFL3BZ/gTPWBaJLTmTIv5gfxoNyWzOW9fVI4kD2+Sp4u/z8Pl/fRbuLZH+XxToh0KuX1XnQeqDy3RlAV8HwsUUN75aXzqQTlhbh2l4XteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFXD4HqeVOBRsDIUjnbGlgnol0XrzGsCIxG2g7FzfFo=;
 b=X/7sXdygeQoFGibbzFh/uvJ/s/Q5372pKw7WflJb3TcgM5MZC0rqcak3EFd4cyjp8YyhQ4ZkjoZLrNevN9pKOZKeQep0xVG5yNjyWhflTGI2XsDc+L7015EAKdQpGmiY8M9nXVDq/ARH0byhTgAOLdB7PvacRzzC2CWGcUOSW0M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS7PR01MB11388.jpnprd01.prod.outlook.com (2603:1096:604:246::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Mon, 13 Feb
 2023 09:31:27 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::343d:7339:78e5:a46e%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 09:31:27 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Jiri Slaby <jirislaby@kernel.org>,
        =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        =?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= 
        <niklas.soderlund@ragnatech.se>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Topic: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
Thread-Index: AQHZPY8kj9QN2R7bt0udUTepz/GAba7Mkw8AgAAAZ9CAAAeJgIAAAGyAgAAAnACAAAB4EA==
Date:   Mon, 13 Feb 2023 09:31:27 +0000
Message-ID: <OS0PR01MB592210E15CD943F1987316F086DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com>
 <20230210203439.174913-4-biju.das.jz@bp.renesas.com>
 <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com>
 <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org>
 <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org>
 <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
In-Reply-To: <f10bcddd-2905-3f63-dd0a-8424798932dc@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS7PR01MB11388:EE_
x-ms-office365-filtering-correlation-id: 388eb161-efcd-4495-e405-08db0da51514
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vcvhBrXNma83yzd1mzYm9dZFFqBp9hEuRkLqHHHGUGZ/ful7jTSvS//HmrffaEsVdQokYLQXbn4Le/sN7VrFWGeUbFTnlQfKteGh9OoXkyANC/1/pZbLkypF0a+GlNqWEr5rHVALQSwS2xs3PDNszm0VmQu5wt3pQr7sPLGBPIyjfAvl8YPoyoCDZ2SS9+HVwhxiVdilE8BLnssYlIOiHOIKQmJYK7f+ygr24q/NJGRxm5IYerBb+1KRXfEk0EXmC64Cs2/xrbvEW7p9eaWSK2ITaWGpofzn9/s13AzdEbGMOXNH9rdWcEl8WiMnRudRouzvmqbMtVkcb5YdCjcmzuIMI/v7MN1munr8Sx5Ze2ULAmotWZvKGGBGzRx+fECLcwF+kyE6qyki4UgKqo0xRFMeMuVpalf3x26eLUHnQAB8bb90/PhpNyIyhZ0tZl9+IRzP+hFkmtRPXXDe6Ts7xvJfbnuaGcwUjEVKAyG54cDeGUv21KdJalz4H03hrPGMIVIfkqpr+phPgJyHw3vSX870XEOXVGvbfEDpj77aaiZ8ssqfQBzLgYFmjoF4VSI2+V2GP8Wg9YmfTAnSp8hnqSnof7TrMKsrHgJNHUriyNhnc/qVNkaCN7m5mo7lTA7U1ftxIltgkxyJjcKTJjABi3peqt8Mh2eHpup9XwppMnsGMP2KQZlQUXAVA9aVg+FhnPrFdMmSbHrunmMInNJo0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199018)(38070700005)(33656002)(86362001)(38100700002)(122000001)(66446008)(52536014)(41300700001)(8936002)(66476007)(5660300002)(316002)(8676002)(4326008)(76116006)(64756008)(66946007)(66556008)(55016003)(54906003)(2906002)(83380400001)(7696005)(71200400001)(110136005)(478600001)(6506007)(186003)(9686003)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WTJSNXVwb2Z6V09MTDVnd2x5SVc0emtFM3JNTnREZllTZXlJcTUvSnVYSU56?=
 =?utf-8?B?SXdqMU1ocHNGVXZxTFVVZmlwTGtEdkRyd3hJTU11QWhXQ2FxekUvS2VZSTRi?=
 =?utf-8?B?U1h0MkI0ejdxUHI0d0F0YitpM255bDRwSDRwL01FZkdXVldtczVxK3JMTWdh?=
 =?utf-8?B?Rmg5MEh4SENURmM1blZqNjhyOFFZL05wWnl5TXZ6WGVjaUR5cXowSFhnYnNr?=
 =?utf-8?B?bTBBOVVtdTh4bVA3N0p2bEtpSnZKU1ZsR3hIVFNEeE0yQThnRkxyQkRpZzlj?=
 =?utf-8?B?UEtIdTNxdTJ5RzZ5emg3dWhMWUpzS0RJU1hlbVFsTTlnV2xnam5VTDUvN1Uw?=
 =?utf-8?B?NEl5aFRrcjE1bmhsQm8wVHJLT2F3Q2hSdWdidnlmYmQvR1Q4eVVpZFZlZnFH?=
 =?utf-8?B?YUJ6aUo0eGJxNUprcm00dTVNbXdOcVhmQ1JOSU1HV0VaWTJZQzBmWEwwVFBQ?=
 =?utf-8?B?dzZseUdlRVRDRnBZV1BLcDc4a3BEQlhzc2xUSjZDMlBrYWVVVFNtUGhIY3F2?=
 =?utf-8?B?MGpiaVpXZVp6MTBkTXJVMjFoRmtVbnFYdVQ3cnVacFpNUnIvRVpSSWNRSyt1?=
 =?utf-8?B?ZmMyOG9tRmlYQTh1QlF5bVJsT0lWVEszK3RGbDBLLzN2a2hnNVdiWGQ1MjJC?=
 =?utf-8?B?cSsvNmJ4MGhyUStVYnF1MkpOVXltUXlQSm1jRlJUZ0cyNmdHYlorK0p1RGZD?=
 =?utf-8?B?NUdvRDVjYllPQndMOVJLcnNFV3l1M09QR09vL2cwSFFwUWJHQkxVYmRBN3hO?=
 =?utf-8?B?Mlk0WlI2RDlvQ1k2ajNNdGx2WVFweFk1MjhZV0J1bUgxN3VVcUlJODJiSkVS?=
 =?utf-8?B?WDl1RGxsdVd0bmIwQnkzRzNicjhtTzJDMUxqV1VpTVdhSGg4aUVDT0hhNzFE?=
 =?utf-8?B?V3g4TE5VUlg4RFVlUmhMTVExN1V5OXh6Z3JWOTVXYXRyKy9JcjJmSFQyNlhy?=
 =?utf-8?B?ZzNmSGMrY0J3cXoybDF5L2VqeG1pR2E0K3BFeXd4Sno4bTExQmVIeTMvOGtp?=
 =?utf-8?B?bVA4WVZTYXNsZHFzR3FVK25LcTE5VTkzNlE1NTFCMTVUTExOZElabStKTHB4?=
 =?utf-8?B?OXN3a3B3MTZRWXV1Y1lacVNVT1VjU0t3NHM4RVBiYkR4cnlUN3hSU1VKZFpP?=
 =?utf-8?B?OXJubFh4OHNGb2JRRnBBTW9tVWFaMkI3aGFQS0JrRXpHdjhKTS8rdFJ6Vm9L?=
 =?utf-8?B?U0YxYkc3TzBPK3VXcTFFWDVVNUlIQnhXeTdFV25OS1BsT3QxVnBrT1Vnc2pI?=
 =?utf-8?B?eUdrU3JTWFUyM2NmUy9IbW84bW5mNGFVR3RneTc2a3lGdFZrR3h2aW5HcUdz?=
 =?utf-8?B?b0lZVkFEUXdzaFF2Y0tnbGdpRWNVaUJaOXhnVisvRUMwVCtrQWVRVk9ZYTQ1?=
 =?utf-8?B?N2xsYUNiSFF4ZlNrRHZPWlBPN2RmVjFJZGh3Zm5YL05QYmlDdVdQZXNRMkxv?=
 =?utf-8?B?QlRVSXRxYU10NzFmYmYrMXFjQ1kvSVJIajRYT2NHQUU4d043ZXhqeVYvRnJ3?=
 =?utf-8?B?SDhGbjkxVkIva21BY01SS01pS1JwRklFdStyWE5ML3A0YVNOVS84S21PWG51?=
 =?utf-8?B?TXg1c2I5U3BZdTV0VmVqMHd5bVk4aVlDWEk3cVRMYlVwOGJLRStjalp1SGtq?=
 =?utf-8?B?cVdtalNoU1VwcXZQbmlsU1J2bUtDNUYzTk9CeHpRZytLK2Z4UjdFR3c5Y3J3?=
 =?utf-8?B?enVqaFZqcWRwWTFwR1BXK3hjcUJUdnVyNTdYU2htQmxROHVzMXdFVloxUlIv?=
 =?utf-8?B?eG1HL3dvR1N0R1Z3c01oTGw4Y0YxWGZsYW1oeU9xbVEwQ0cvV2tFbmRrUDU1?=
 =?utf-8?B?aWIwend6bEcxbFA3RTFNQy9RTi92WDQ1MS9SblJCU2w2cUtxcnBqRFNlRGdp?=
 =?utf-8?B?S0ZicUpTZEt5bUZzYVp2eVQ2MjVIWERTRTU4c3RET0c2TEo2NEZoaml1SnZr?=
 =?utf-8?B?QlNTeXF4MHhwYjliYWlyUEZvQlRTeWIvbHd6Vkh6V3ZqajJ3NkpTYmFCdEFL?=
 =?utf-8?B?RlNoYld3dEFpNG5iQ3pQN0pNRXcyZ0x1WnB2c0NZVkpLcnQzbXhyY2twZitJ?=
 =?utf-8?B?MWVpMDMxNGhRR05yQkZ1QXl1b2lnU1crT3RIMzFQQ0tLbWRjMDBOdVh3dHQ5?=
 =?utf-8?B?Y0dqaUkzLzN6aUVSY0FPVmY0VzE0bzZpcHphMmt1a1E0eFpaUk1jY2ZrdExr?=
 =?utf-8?B?VFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 388eb161-efcd-4495-e405-08db0da51514
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 09:31:27.7200
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BOlRFTq/DYF4aZ1/Daa5nwQQqixkHLJ9y43IRLZ2HbQaoo/EnoTSHFxAE0cc8l05ohYXcg6SIp6f5aAY3jv6NSLjTV94dE92z7J9XCrUs8M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11388
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgSmlyaSBTbGFieSBhbmQgSWxwbywNCg0KVGhhbmtzIGZvciBmZWVkYmFjay4NCg0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYzIDMvM10gc2VyaWFsOiA4MjUwX2VtOiBBZGQgc2VyaWFsX291dCgp
IHRvIHN0cnVjdA0KPiBzZXJpYWw4MjUwX2VtX2h3X2luZm8NCj4gDQo+IE9uIDEzLiAwMi4gMjMs
IDEwOjEyLCBKaXJpIFNsYWJ5IHdyb3RlOg0KPiA+IE9uIDEzLiAwMi4gMjMsIDEwOjEwLCBKaXJp
IFNsYWJ5IHdyb3RlOg0KPiA+PiBPbiAxMy4gMDIuIDIzLCA5OjUzLCBCaWp1IERhcyB3cm90ZToN
Cj4gPj4+Pj4gK3N0YXRpYyB2b2lkIHNlcmlhbDgyNTBfcnp2Mm1fcmVnX3VwZGF0ZShzdHJ1Y3Qg
dWFydF9wb3J0ICpwLCBpbnQNCj4gPj4+Pj4gK29mZiwgaW50IHZhbHVlKSB7DQo+ID4+Pj4+ICvC
oMKgwqAgdW5zaWduZWQgaW50IGllciwgZmNyLCBsY3IsIG1jciwgaGNyMDsNCj4gPj4+Pj4gKw0K
PiA+Pj4+PiArwqDCoMKgIGllciA9IHNlcmlhbDgyNTBfZW1fc2VyaWFsX2luKHAsIFVBUlRfSUVS
KTsNCj4gPj4+Pj4gK8KgwqDCoCBsY3IgPSBzZXJpYWw4MjUwX2VtX3NlcmlhbF9pbihwLCBVQVJU
X0xDUik7DQo+ID4+Pj4+ICvCoMKgwqAgbWNyID0gc2VyaWFsODI1MF9lbV9zZXJpYWxfaW4ocCwg
VUFSVF9NQ1IpOw0KPiA+Pj4+PiArwqDCoMKgIGhjcjAgPSBzZXJpYWw4MjUwX2VtX3NlcmlhbF9p
bihwLCBVQVJUX0hDUjApOw0KPiA+Pj4+PiArwqDCoMKgIC8qDQo+ID4+Pj4+ICvCoMKgwqDCoCAq
IFRoZSB2YWx1ZSBvZiBVQVJUX0lJUiBhbmQgVUFSVF9GQ1IgYXJlIDIsIGJ1dA0KPiA+Pj4+PiAr
Y29ycmVzcG9uZGluZw0KPiA+Pj4+PiArwqDCoMKgwqAgKiBSWi9WMk0gYWRkcmVzcyBvZmZzZXQg
YXJlIGRpZmZlcmVudCgweDA4IGFuZCAweDBjKS4gU28gd2UNCj4gPj4+Pj4gbmVlZCB0bw0KPiA+
Pj4+PiArwqDCoMKgwqAgKiB1c2UgcmVhZGwoKSBoZXJlLg0KPiA+Pj4+PiArwqDCoMKgwqAgKi8N
Cj4gPj4+Pj4gK8KgwqDCoCBmY3IgPSByZWFkbChwLT5tZW1iYXNlICsgKChVQVJUX0ZDUiArIDEp
IDw8IDIpKTsNCj4gPj4+Pg0KPiA+Pj4+IEkgZG9uJ3QgZ2V0IHRoZSBtZWFuaW5nIG9mIHRoYXQg
Y29tbWVudC4gSXQgZG9lc24ndCBzZWVtIHRvIG1hdGNoDQo+ID4+Pj4gd2hhdCB5b3VyIGNvZGUg
ZG9lcyBhcyB0aGUgY29kZSBzZWVtaW5nbHkgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aA0KPiA+Pj4+
IElJUiAoYW5kIG5vbmUgb2YgeW91IGNoYW5nZWxvZ3MgcmVmZXIgdG8gSUlSIGVpdGhlcik/DQo+
ID4+Pg0KPiA+Pj4gVGhlIGdlbmVyaWMgbWFjcm8gVUFSVF9JSVIgYW5kIFVBUlRfRkNSIGluIGxp
bnV4L3NlcmlhbF9yZWcuaCBoYXMgYQ0KPiA+Pj4gdmFsdWUgb2YgMi4NCj4gPj4NCj4gPj4gU3Vy
ZSwgSUlSIGlzIG5vcm1hbGx5IFdPIGFuZCBGQ1IgUk8NCj4gDQo+IFdoYXQgd2FzIEkgdGhpbmtp
bmc/IFN3aXRjaCB0aGF0IFdPIGFuZCBSTywgb2YgY291cnNlLg0KPiANCj4gPiBhbmQgc2hhcmUg
dGhlIHNhbWUgcmVnaXN0ZXIuIEkNCj4gPj4gd291bGQgc2ltcGx5IGRlZmluZSBVQVJUX0ZDUl9S
WiAob3IgYWxpa2UpDQo+ID4NCj4gPiBPciBldmVuIFVBUlRfRkNSX1JPX1JaPw0KPiA+DQo+ID4+
IGZvciAweDEyLg0KPiA+DQo+ID4gSSBtZWFuIDEyIG9yIDB4Yy4NCg0KQXMgcGVyIEdlZXJ0LA0K
DQoiQWNjb3JkaW5nIHRvIFIxOVVIMDA0MEVKMDQwMCBSZXYuNC4wMCBpdCBpcyBhdmFpbGFibGUg
b24gRU1FVjIsIGFuZCB0aGUNCmxheW91dCBsb29rcyBpZGVudGljYWwgdG8gUlovVjJNLiINCg0K
QWRkaW5nIE1hZ251cyBhbmQgTmlrbGFzIHRvIHRlc3Qgb24gRU1NQSBtb2JpbGUgcGxhdGZvcm0g
dG8gY2hlY2sgdGhlIHBvcnQgdHlwZSBkZXRlY3RlZA0KT24gdGhhdCBwbGF0Zm9ybT8NCg0KU28g
bG9va3MgbGlrZSBzaW1pbGFyIHRvIG90aGVyIG1hY3JvcywgVUFSVF9GQ1JfRU0gKDB4MykgaXMg
c2Vuc2libGUgb25lLg0KDQpVQVJUX0ZDUl9ST19PRkZTRVQgKDkpDQpVQVJUX0ZDUl9ST19FTSAo
VUFSVF9GQ1JfRU0gKyBVQVJUX0ZDUl9ST19PRkZTRVQpDQoNCg0Kc3RhdGljIHVuc2lnbmVkIGlu
dCBzZXJpYWw4MjUwX2VtX3NlcmlhbF9pbihzdHJ1Y3QgdWFydF9wb3J0ICpwLCBpbnQgb2Zmc2V0
KQ0KY2FzZSBVQVJUX0ZDUl9ST19FTToNCglyZXR1cm4gcmVhZGwocC0+bWVtYmFzZSArIChvZmZz
ZXQgLSBVQVJUX0ZDUl9ST19PRkZTRVQgPDwgMikpOw0KDQoNCkNoZWVycywNCkJpanUNCg0K
