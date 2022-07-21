Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44E8757CA99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jul 2022 14:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233079AbiGUMZM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jul 2022 08:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233157AbiGUMZK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jul 2022 08:25:10 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2125.outbound.protection.outlook.com [40.107.114.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E9FEBD;
        Thu, 21 Jul 2022 05:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE0Ld26Q4TC1tQM1+rc36zqi1nNJ1DPyBH5vGuAGq+PR0PIOqEj9fvm5Q07A3Hj7v3ykRPIR3Mv36+/52x+RodqirSIaJx9IA1F1Zdskjxy1X1QeIWRg3DrAdpmgURbsmnq+oaF5vlGbhzarTk4OSOcCl/mbL6h2SAhHEcaRtp5RFdo4saI81s8T31Y+qd0lCXpjX/A0LM23sAfZLR3hebSOR5ZqP4kJ+G7H89qaMKuyuSTJHJBdYAFffdh44ktORrZGm7ecmbTHnCZsbVQcYjxe5xi50ZZKLsyBaBP4XBJxG84G1WgpKwtXbYmevXC2VbKuLiW0LGf9TPF0ezFQ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okplihKCvX96XMG9lKUj1wveRsLso8RqrLrhBx470O0=;
 b=NwOzOJcuAIIzmxAMyiMcgrz61YywGcxnQ0Q2hwTq7VFfNPVZ4Qzsi0zfEUtAgA81sIp/ulYPPN0AkSldr6VqUstwWC3EENTxTw/U/cwRnBo5B6Way+3xd4L+AKJxarC+pYkHUt5qWgM0HBNieuI0sCHNd2Swroa6ARWwnb0YJh5AuZ1Xa6GprQMj2XuenqdkjQlYcO9DUGa5F8NxeQhhyojAx23URtFXYxMcGzLPlJceDSFaJYP3Db5Di3AAP8FQT/LvCS/VQtyLUxgI6kOzXWG5LsXU1vuMDs6vES+eyHHmJMjE2Dy1mdY+g9PHLCTcKw/CPdWP7hJpSQHKgnZdlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=okplihKCvX96XMG9lKUj1wveRsLso8RqrLrhBx470O0=;
 b=k2QEUHEDor2ozsZ8b7OCEKaO+sm2Jt3o4tQOxyA/9VHrRFIxwAn7P37nyEiM15pfLk2lYcav0D56vx7aYD4iPMfV/jT1XRBZ/QC8uhSQtkpC6r1mxfJG+QbTm8OysX1yUHgveB6A4TfeHl+OpUMfrn8MtgKM0p7deccyKbINmnA=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSAPR01MB4931.jpnprd01.prod.outlook.com (2603:1096:604:68::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Thu, 21 Jul
 2022 12:25:06 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5458.018; Thu, 21 Jul 2022
 12:25:06 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Adam Ford <aford173@gmail.com>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Topic: [PATCH 2/2] usb: gadget: udc: renesas_usb3: Add support for
 RZ/V2M
Thread-Index: AQHYmqymW/0eL/mqCEKHRkgiHHt+a62IwEAAgAABA/A=
Date:   Thu, 21 Jul 2022 12:25:05 +0000
Message-ID: <TYYPR01MB7086F7C2A25D70EABB9BD338F5919@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-3-phil.edworthy@renesas.com>
 <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
In-Reply-To: <CAMuHMdXuY_HOphyDtw4edZWu_D4QCi2hi-GWLF5R2jPNMHGcpg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab55a754-e857-4c15-48d2-08da6b140b5e
x-ms-traffictypediagnostic: OSAPR01MB4931:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Kn9dRmZoFNptxD7ukogRAwsMa/nMHDa9BGi5bCFJRF8aD38C9CGIu4oDgEReXxlnCdPCeOr+NBeL5OOPvs8lXYL9HSOAeVVKJsdDFKEIHeNC6u4z98kUERouAOKkTD3RcPEXyeDgV9ERak4qyzsM0MpSmkZk+tij69OLyAELEQ19w/fXaxYXVx7Cv3Kvrv4guMANneBZTi6+Y3I+CdMs3q2Xo7YMaIjOtkzr+3eioIIJvMiw0bsXpCHlLhvXM9XGAv7N9TCPSqQRcRnjUlweNH7DepjkX/IDT8z90mLv+sPg/8Ah0d9tHkH2C1dketNgej1ibNOYjKWmqBtCp18mqJvVMJeD532tQAtd1RuFA0UAtg4ULbTODQMrO8CCNIbVy8csZWvmnScZm/evDw26pDzNGm/bW2k1iL1JhNjvJynHOXiivVE+GoVkL9AxZydu937WTHUiKEpJKzwhcNRnZj0sao4xluQ5Fs5JFFb/OydSiKxyyfxqGWIeEKazF6A59R7Pd52GH3NAlh4fGyEyilK+KBLSDsDm+6Ux7zhLRkQWAYndkUM2xrdwnOvKHNllbtSOf4F4c7muKDH23TXd/9LS3JraVd7DLtNQSsMaL/yYNWZdaCGYCbH96U17q4FFE1YmJwhOEJudXQ4x3bYvo29egKnq14oLdRbEGCjQ/jPFPiOpq4In7M21v4RCky9zgJzVWzJTl6WDEKD9dMB2/xCR2EkJO9LyV8+NzqPAE/N/L3AsyDDxe/lB80rPRkiINmNUrAtmc/8sHHG2Vlt+xLbU0a8QUbn9Q4WltiSpMU9NtcZtkvK6YDtLfqXWH4FR
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(39860400002)(396003)(366004)(136003)(41300700001)(122000001)(54906003)(33656002)(64756008)(478600001)(38100700002)(6916009)(7696005)(26005)(71200400001)(6506007)(38070700005)(316002)(186003)(53546011)(8936002)(9686003)(55016003)(66946007)(66556008)(4326008)(44832011)(66476007)(8676002)(52536014)(5660300002)(66446008)(76116006)(86362001)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cERnUmdKR1lPUlhPWW5CY21RK1ltdGpuRjIzMlVTQkZMdmhWODdxTThYQTlP?=
 =?utf-8?B?M2VuSndINVQ0bFdjT3FOdS9EcmdCVUIrbGZNRTRzbFhOcEVpNTNrcWkwOGNV?=
 =?utf-8?B?dmhIbUFoZ3BkZnVoNVFpVy85UEpJdVNCOFFENlFDQyt6REZiaXlnaGdDYk1B?=
 =?utf-8?B?QmRvanZmWmtEL2lDTEJPVjB5V0JqWjQ4ODhMUlVMRTRaWGpGejY0OWthUkNp?=
 =?utf-8?B?ZUJvKzJSRC83cUd5M1BiR0FWaUo2dEtMWVA5b2pwUTlNZ2kzUFNwYWE5aUQ5?=
 =?utf-8?B?TnJGTldlMnRpVlRlQ0VqcHE0V0h0Q1FNSjRHQTVaM2FXRVVYUktPTDc0czF3?=
 =?utf-8?B?OVkvQjZIZ1FnSDhReHZmK1VWcitTR2NyOGZlTnhPSVFVaS9rWTlMd0s0d2xx?=
 =?utf-8?B?UzYzNjBmY3AyRlNDRVlTcmpKeTBtdEFrVmxUNS9UTlNNUzNDKzM0RU9iYWZ0?=
 =?utf-8?B?RVZtWjNLa0lBYjA0ZGQ0QnV6SGJGRUUrTTRXd09oN2xOK0FwR002ZU1DMG1G?=
 =?utf-8?B?UHR3ZWd2ZkRTbGQzdVJic2JWeGpRWFh2N3hnay9XNE1yQllhdUlkR05Db2Vk?=
 =?utf-8?B?bFFwenVnUmxsNENhU0tIQ2pOU3dtUFJnc2lLUEtVZSsyUUgrZXVISndHYldt?=
 =?utf-8?B?aktFTzJ4ekRVYWhSRGtPN1lISFEvT0RRVlRCNWx6RW9KRGNOSC93ZGNOdmVF?=
 =?utf-8?B?cjRJSkJHWW5lQ21aTnBDMjZpSFljS3lSMTNVY0VIekU4Q2M0ZDVVTk9zZ0t4?=
 =?utf-8?B?bXAwVzBHdlBNR0lKa3NtZ3BEd0ZPajUyVnNHQTg5enEwaFZBR2htUU05QmxS?=
 =?utf-8?B?ekdOMk5NaVZBK0VmNVdzMkJNRURBa2t5STFkMjRFZ0VDQ2ZkckwwaGhEWDN0?=
 =?utf-8?B?OGM5dnIySGgwR1hHL0ltK2diNUhQdEFwZXJJYTY3K2djNW1hMk90dXRmWFFQ?=
 =?utf-8?B?eXF1NVJsV2pVdjlKekVzZFhqbnJIMHQ0dm1IVTVhdU1pb0drMWRibE5KU2RF?=
 =?utf-8?B?RVV2TVd3V0tjellnUU1tbzM2Q0F0aHQxRENEK2VhMi96TUxJVm5ya2V2QnUz?=
 =?utf-8?B?d1BzdDBSZHNQbVB5UWJKQkV1SXhIK2tHdHkvYnlubHhGSnhacHk1aTB3UmM1?=
 =?utf-8?B?cmVURVBCNXF2eC9yOHo1UVE3RGc1cSs1NlozVVJWL2lIQzYvcmV1K2s1NUNs?=
 =?utf-8?B?MEFzVHloU3FBbHdZcVZpS0lwc3NIcHdRVWwzbGIvNUcrWnNickRGMkloRjh5?=
 =?utf-8?B?V2hPbVRUalU0OTF6bVJaSnZGWnIwcURKWVdTUVNpcGw0WjFxdEFHTmdqaE50?=
 =?utf-8?B?TFFkQ284VXR4eVVxazE4ZjRDSmR0NXlwbVFtb0Z5emNrNTc3Zy85K2thczdY?=
 =?utf-8?B?ZWh3LzFZK0c1NVJHZTIwcndiUzBRUVlORVl2Rkl1TTlQTk50dzRkOHpLTmcy?=
 =?utf-8?B?dmJVMmpXclpHdUEvSlZWWkRabVNZRWpwQkFPaUNLdnljK1NvRXMwYUxJSU5j?=
 =?utf-8?B?UFg3OHhtMW9DeEhmYlBpVzRZZm8wMWRJM1ZFa2xKOTI1ak5uK2tsVkRDS1di?=
 =?utf-8?B?RTYrNnpLTVBESkYyRnIzc2c4UHRoVmRRZ1YyVFRNRjF1Y3RwdVdrWVFHUWpE?=
 =?utf-8?B?SmttbjVNcHhBNkVmNm9PMjEzdGVtcEhMZDgxZmtuNVFIZXJBT2tsU2VkRlFE?=
 =?utf-8?B?U05HbUhHb3l6dzQ5dDlxUzBudzQ1OEdZZ3dMcTF4OWx1MjY0WWljUGpCR1ps?=
 =?utf-8?B?WDFMd09ncjNNaklvcTN6QmpJVWdYTy94TzhVdjRNUjhqeFdXL01WQzlKSTlz?=
 =?utf-8?B?bjFqWndsVDFqK1Rxa24vVlNRVW9iZlJwRm1uQ3lVT3ozVW4wYVRYNVNUb3ls?=
 =?utf-8?B?RjdxcmM4LzlVR3J5N1RFYXpOVHJZRHZiaDJvb3ZmWWg5U05mUGV0aDhtWFZ2?=
 =?utf-8?B?R09ZSTY2TVJLai83VTI0MU5iMUE0blphcjh0SUROamZMY0N2bmk0bDF5RWdh?=
 =?utf-8?B?OUZiYUFkNVBLaG9nc2FuKzg2SkltaWZzdjhFUVhIWHlaRUs1OU9HNXVVQXhF?=
 =?utf-8?B?dnZBYzZrbTcwTzVwZ1FXZzBWWitOVUdQWGs5WmkvdEorcm9TT2w0MFh1cys5?=
 =?utf-8?B?TkNPcllJcHZHem1lNVNkbWRNR01rK1cvUmJsdDFBSVk2bldtaXFMMkc5cisv?=
 =?utf-8?B?V2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab55a754-e857-4c15-48d2-08da6b140b5e
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 12:25:06.0124
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nfR4zmSmOTF7fCS0kN1Jt6OXxwQsoF5yZBrix4BG0SUQbbJJdKdHAsDt+RRBtfZzD3gGFizMAf8/v0FRKjzTbInKHOPAfo4xHgTHn3yr4dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB4931
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgeW91ciByZXZpZXchDQoNCk9uIDIxIEp1bHkgMjAyMiAx
MzoxMCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6DQo+IE9uIE1vbiwgSnVsIDE4LCAyMDIyIGF0
IDM6NDUgUE0gUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4gPiBSWi9WMk0gKHI5YTA5ZzAxMSkgaGFz
IGEgZmV3IGRpZmZlcmVuY2VzOg0KPiA+ICAtIFRoZSBVU0IzX0RSRF9DT04gcmVnaXN0ZXIgaGFz
IG1vdmVkLCBpdHMgY2FsbGVkIFVTQl9QRVJJX0RSRF9DT04gaW4NCj4gPiAgICB0aGUgUlovVjJN
IGhhcmR3YXJlIG1hbnVhbC4NCj4gPiAgICBJdCBoYXMgYWRkaXRpb25hbCBiaXRzIGZvciBob3N0
IGFuZCBwZXJpcGhlcmFsIHJlc2V0IHRoYXQgbmVlZCB0bw0KPiA+ICAgIGNsZWFyZWQgdG8gdXNl
IHVzYiBob3N0IGFuZCBwZXJpcGhlcmFsIHJlc3BlY3RpdmVseS4NCj4gPiAgLSBUaGUgVVNCM19P
VEdfU1RBLCBVU0IzX09UR19JTlRfU1RBIGFuZCBVU0IzX09UR19JTlRfRU5BIHJlZ2lzdGVycw0K
PiA+ICAgIGhhdmUgYmVlbiBtb3ZlZCBhbmQgcmVuYW1lZCB0byBVU0JfUEVSSV9EUkRfU1RBLCBV
U0JfUEVSSV9EUkRfSU5UX1NUQQ0KPiA+ICAgIGFuZCBVU0JfUEVSSV9EUkRfSU5UX0UuDQo+ID4g
IC0gVGhlIElETU9OIGJpdCB1c2VkIGluIHRoZSBhYm92ZSByZWdzIGZvciByb2xlIGRldGVjdGlv
biBoYXZlIG1vdmVkDQo+ID4gICAgZnJvbSBiaXQgNCB0byBiaXQgMC4NCj4gPiAgLSBSWi9WMk0g
aGFzIGFuIHNlcGFyYXRlIGludGVycnVwdCBmb3IgRFJELCBpLmUuIGZvciBjaGFuZ2VzIHRvIElE
TU9OLg0KPiA+ICAtIFRoZXJlIGFyZSByZXNldCBsaW5lcyBmb3IgRFJEIGFuZCBVU0JQDQo+ID4g
IC0gVGhlcmUgaXMgYW5vdGhlciBjbG9jaywgbWFuYWdlZCBieSBydW50aW1lIFBNLg0KPiA+DQo+
ID4gU2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNv
bT4NCj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29t
Pg0KPiANCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3Vz
Yi9nYWRnZXQvdWRjL3JlbmVzYXNfdXNiMy5jDQo+ID4gKysrIGIvZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9yZW5lc2FzX3VzYjMuYw0KPiANCj4gPiBAQCAtMzYzLDYgKzM2OCw3IEBAIHN0cnVjdCBy
ZW5lc2FzX3VzYjMgew0KPiA+ICAgICAgICAgYm9vbCBmb3JjZWRfYl9kZXZpY2U7DQo+ID4gICAg
ICAgICBib29sIHN0YXJ0X3RvX2Nvbm5lY3Q7DQo+ID4gICAgICAgICBib29sIHJvbGVfc3dfYnlf
Y29ubmVjdG9yOw0KPiA+ICsgICAgICAgYm9vbCByOWEwOWcwMTE7DQo+IA0KPiBBbnkgYmV0dGVy
IG5hbWUgZm9yIHRoaXMgZmVhdHVyZSBmbGFnPw0KTm90aGluZyBzcHJpbmdzIHRvIG1pbmQuIFdl
IGNvdWxkIHVzZSBzZXBhcmF0ZSBmbGFncyBmb3IgaGFzX3Jlc2V0cywNCmhhc19kcmRfaXJxLCBt
YXhfbnJfcGlwZXMgYnV0IEkgYW0gc3RydWdnbGluZyB0byBjb21lIHVwIHdpdGggbmFtZXMNCmZv
ciB0aGUgb2Zmc2V0IHJlZ2lzdGVycyBhbmQgbW92ZWQgYml0cy4gQW55IHN1Z2dlc3Rpb25zPw0K
DQoNCj4gPiAgfTsNCj4gDQo+ID4gQEAgLTI3MDcsNiArMjczMywxMiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IHJlbmVzYXNfdXNiM19wcml2DQo+IHJlbmVzYXNfdXNiM19wcml2X3I4YTc3OTkwID0g
ew0KPiA+ICAgICAgICAgLndvcmthcm91bmRfZm9yX3ZidXMgPSB0cnVlLA0KPiA+ICB9Ow0KPiA+
DQo+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgcmVuZXNhc191c2IzX3ByaXYgcmVuZXNhc191c2Iz
X3ByaXZfcjlhMDlnMDExID0gew0KPiANCj4gcmVuZXNhc191c2IzX3ByaXZfcnp2Mm0/DQpPaw0K
DQo+ID4gKyAgICAgICAucmFtc2l6ZV9wZXJfcmFtaWYgPSBTWl8zMkssDQo+ID4gKyAgICAgICAu
bnVtX3JhbWlmID0gMSwNCj4gPiArICAgICAgIC5yYW1zaXplX3Blcl9waXBlID0gU1pfNEssDQo+
ID4gK307DQo+ID4gKw0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCB1c2Iz
X29mX21hdGNoW10gPSB7DQo+ID4gICAgICAgICB7DQo+ID4gICAgICAgICAgICAgICAgIC5jb21w
YXRpYmxlID0gInJlbmVzYXMscjhhNzc0YzAtdXNiMy1wZXJpIiwNCj4gPiBAQCAtMjcxNyw2ICsy
NzQ5LDkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgdXNiM19vZl9tYXRjaFtd
ID0NCj4gew0KPiA+ICAgICAgICAgfSwgew0KPiA+ICAgICAgICAgICAgICAgICAuY29tcGF0aWJs
ZSA9ICJyZW5lc2FzLHI4YTc3OTkwLXVzYjMtcGVyaSIsDQo+ID4gICAgICAgICAgICAgICAgIC5k
YXRhID0gJnJlbmVzYXNfdXNiM19wcml2X3I4YTc3OTkwLA0KPiA+ICsgICAgICAgfSwgew0KPiA+
ICsgICAgICAgICAgICAgICAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHI5YTA5ZzAxMS11c2IzLXBl
cmkiLA0KPiANCj4gQXMgdGhlIGJpbmRpbmdzIGluY2x1ZGUgYSBmYW1pbHktc3BlY2lmaWMgY29t
cGF0aWJsZSB2YWx1ZSwgeW91IHNob3VsZA0KPiB1c2UgdGhhdCAoInJlbmVzYXMscnp2Mm0tdXNi
My1wZXJpIikgaGVyZS4NCk9rDQoNCj4gPiArICAgICAgICAgICAgICAgLmRhdGEgPSAmcmVuZXNh
c191c2IzX3ByaXZfcjlhMDlnMDExLA0KPiA+ICAgICAgICAgfSwgew0KPiA+ICAgICAgICAgICAg
ICAgICAuY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJjYXItZ2VuMy11c2IzLXBlcmkiLA0KPiA+ICAg
ICAgICAgICAgICAgICAuZGF0YSA9ICZyZW5lc2FzX3VzYjNfcHJpdl9nZW4zLA0KPiANCj4gPiBA
QCAtMjc1OCwxMyArMjc5MywyMiBAQCBzdGF0aWMgaW50IHJlbmVzYXNfdXNiM19wcm9iZShzdHJ1
Y3QNCj4gcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiA+ICAgICAgICAgZWxzZQ0KPiA+ICAgICAg
ICAgICAgICAgICBwcml2ID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5kZXYpOw0K
PiA+DQo+ID4gKyAgICAgICB1c2IzID0gZGV2bV9remFsbG9jKCZwZGV2LT5kZXYsIHNpemVvZigq
dXNiMyksIEdGUF9LRVJORUwpOw0KPiA+ICsgICAgICAgaWYgKCF1c2IzKQ0KPiA+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4gPiArDQo+ID4gKyAgICAgICBpZiAocHJpdiA9PSAm
cmVuZXNhc191c2IzX3ByaXZfcjlhMDlnMDExKQ0KPiANCj4gUGxlYXNlIHN0b3JlIHRoZSBmZWF0
dXJlIGZsYWcgaW4gcmVuZXNhc191c2IzX3ByaXYgaW5zdGVhZCBvZiBkb2luZyBhbg0KPiBleHBs
aWNpdCBjb21wYXJpc29uLg0KT2ssIHdpbGwgZG8hDQoNCj4gPiArICAgICAgICAgICAgICAgdXNi
My0+cjlhMDlnMDExID0gdHJ1ZTsNCj4gPiArDQoNClRoYW5rcw0KUGhpbA0K
