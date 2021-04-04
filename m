Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5213538AD
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  4 Apr 2021 17:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231150AbhDDPvQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 4 Apr 2021 11:51:16 -0400
Received: from mail-eopbgr30059.outbound.protection.outlook.com ([40.107.3.59]:46978
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231144AbhDDPvN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 4 Apr 2021 11:51:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ax+cp7gG2nM+D+tvg0DYuju8sO8ANIk24xqsml6+vXJ2FXswtYpNwMiLusYjO8kQGMNravlHdSSWMU9/xzYCwDljres7iIljSF8xNs/4gwg4sEEp+OOg5L+8w10NuBY74OqsQ+1ohBWH/zsve3dKhPteTfqid6JZQqOIVz8d5MJunMxvWPwtGa6B7dXxF9VnHCGiEx0sSQ+0J9DXwYsCFy70O/pV2SQKIHg4m/YYy6BeR6Q6CpCtXajGbAmq1sQijQOid6IzzsgI6eFgV4KwA1p05MQS7pNWsORrsQqECFWYBY7bfKKo7xu5sTtkl8ktL36Q3jDH9vD2z5GBscc+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibqjAYbfXyJ3eXApMGj5fG+Lb/3jWC87jUH0ur4H5WI=;
 b=MucILu38TodQSWmynaqwJQz+u7LAjPq4NVmbBP6u9UhTHABK836jaoFwjBlHyDBsSBaCBqmBo7MfbBGH6aqNL89iboIkzxGNynJRvdRVI/TJOUUzAxa0MUKAsTU8Nqrjy/kvofOceAWYIvYeif6lE6uj3HWGoI3z/WwrbaESF2P7u94g3FPG3QviPB0DZgIqpxV48xY+9twPGUTzw7+9bra1IuZW8/BsHfPg2DBWnCDEwkWS1fRPwgXEPiryevWRiHVcJ12ZAFd03opnXDe2cQ8LbTq8ygMIUTfM96Ryzf0GqP4HWOrbl7jAY4wwTzB6WjpjD7o4frulJz/JVRtwHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductoreurope.onmicrosoft.com;
 s=selector1-rohmsemiconductoreurope-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibqjAYbfXyJ3eXApMGj5fG+Lb/3jWC87jUH0ur4H5WI=;
 b=Igm8Pjsm8KYt9uWXBu3J5C8OyDgRSe0axEbYx2dPAucIltTtEC57Aoq1pJpVRL5cphZ8e5nvKi52nSMxwOsX8N7Dso1oso/TKT/vmhuDzzSnItNR7QgHUuwXNOjHIhYUMksElhjcsUoeA45QKpWJxy+E2U70L4TwKOjWC/M6Z84=
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com (2603:10a6:7:55::20) by
 HE1PR0301MB2282.eurprd03.prod.outlook.com (2603:10a6:3:24::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.28; Sun, 4 Apr 2021 15:51:07 +0000
Received: from HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd]) by HE1PR03MB3162.eurprd03.prod.outlook.com
 ([fe80::f4d0:ee66:d5fb:9cdd%3]) with mapi id 15.20.3999.032; Sun, 4 Apr 2021
 15:51:07 +0000
From:   "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To:     "broonie@kernel.org" <broonie@kernel.org>
CC:     "agross@kernel.org" <agross@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-power <linux-power@fi.rohmeurope.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
Subject: Re: [RFC PATCH v3 7/7] regulator: bd9576: Fix the driver name in id
 table
Thread-Topic: [RFC PATCH v3 7/7] regulator: bd9576: Fix the driver name in id
 table
Thread-Index: AQHXFmC+ynozzlF/7ECI90N+Zz5USaqhm+EAgAMMAgA=
Date:   Sun, 4 Apr 2021 15:51:07 +0000
Message-ID: <820d9ab623d586cf5e5e7897a044e57424b6ac90.camel@fi.rohmeurope.com>
References: <cover.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <9fd467d447cd2e002fa218a065cd0674614b435f.1615454845.git.matti.vaittinen@fi.rohmeurope.com>
         <20210402171920.GD5402@sirena.org.uk>
In-Reply-To: <20210402171920.GD5402@sirena.org.uk>
Reply-To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Accept-Language: fi-FI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.34.4 (3.34.4-1.fc31) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none
 header.from=fi.rohmeurope.com;
x-originating-ip: [2001:14ba:16e2:8300::6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 77675811-e3c0-4f30-7952-08d8f78175db
x-ms-traffictypediagnostic: HE1PR0301MB2282:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <HE1PR0301MB2282EFDAC2E3C7AA7FF69D5FAD789@HE1PR0301MB2282.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EogiZsQKblCU2C0GEtCmD5Hyfxv3V3lNq6H/a3aG+xNmoQmtEej+AdQOv/QEG+YEPCGbV6VMOxG2NfAoJHbfvwO3WbBaYb/myrcHefNv9Gz3fBolGF0J7Tdh9PbGDLZSWjFozWrRCiTfGFypaCHx1pp0Li+XDVa6m/jKtfGGAD12NYVb9GRo3vnWnV7OiEVEoBFDIR/gpmblxdlPOB8FSWMxIRKQJWdWzpfCVseEda/RPjsjHc0Z/hM3wJbYLiaBOXKd2HkwC5P2zrIAH78LMAPT8VQaKsvfye/j4wO2dntL/8xXRsZrweqGEVVI5NGW1+dsFKTjX35HBlbFl5rDAVHVuVGuQdt8CFh6gOlk02lzFYgNxJsPMCmUlM0o4sH3UwpdZQnaj6qQRtM6eCD4Ui8E+wRSvXdrra31Z3JFBXaC9QOIDY9HXfAyeX56CtQyOwaMsNhaf9tWvsFHY91faUKAfzkIfCAVPpCazo9gZWwsyQQK3P1GgsGZDZdmUg85G3fLZuUa0Jwt9wcsXzNoHNR1WEdOrqH++OLuBp40FkQfCaw3sQieq5Gnm1xhZmA9EEhkBcDHJ0XsBZOUfLb6f46QyIwOpCgXEZEaj0gOjAV4EGI4z4OZRndMn+CL68JP6814tNZbbvtqu3xKgNExKSFbNpewVLz1jXiqDlmWylfrGyvqhvoYCHuv6nN1aUahVo0P98S/AnH7Mngq3lJhwG5Q3XctNYFFVRZD2n0iUSpUnRnLhQtt8ROj3F30f3gX
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR03MB3162.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(396003)(39830400003)(136003)(966005)(66946007)(76116006)(2906002)(6512007)(6506007)(8676002)(4326008)(71200400001)(64756008)(66556008)(66476007)(478600001)(66446008)(6486002)(86362001)(2616005)(316002)(186003)(3450700001)(4744005)(8936002)(6916009)(5660300002)(38100700001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dFVxSE9nbmZqWFFOM0VjTE9udEUxVnE0UHVKY2Irc3NoLzQxR3ROdTc2OHdv?=
 =?utf-8?B?eCtpV2JHVjFOZ2tnTzJMQy9hQVMweWh4aGVrVm9HWk51TStzUHMrNUJ0ZDBt?=
 =?utf-8?B?akdHa1Flam5GY0xBK1k0cUplTnNjeXl2dzlUVW9mcEZ0aldyN1BhZWdyR1Az?=
 =?utf-8?B?RmRtQldORXBoa0NNSmd1NGl2Y0d3dEN5UStaRGZEMStJSkZNSGdteThSaVdp?=
 =?utf-8?B?TzdFYUJSeUF5QVhpTFlHSVhNNDh3bUJvdE0ydWFmYTEyNGYxd2lZdW5yMWM5?=
 =?utf-8?B?SnVIeDZzMWxVSmxJa2JRb0hlZE0reVBOaHFZZlFtVSs0TFNVTXRLTDBOcHV1?=
 =?utf-8?B?MjB3OUI2b2NPanhhU25haUNJZ1pXSHFTZmV1SDJBb1JuUmo1TDBMSWU1UmFN?=
 =?utf-8?B?Q3NLWTdiUVdDY0pyb2kwYmc3MVNJeDFCRDVjTDRpRUdvRXNxSlZnQndFeVk2?=
 =?utf-8?B?K1NIQ0k1cHRYWTZ6ODVma0ZvaFppbVVLR1NpcWJVejF2OEZQY2dXK251L29D?=
 =?utf-8?B?Rk9nUGlJU2RkNSs0STdnNUF2QUErdVMxdzFNK2RtcTJtL0dBdGJsNmIzTmpx?=
 =?utf-8?B?MjZmNDFwa2M0eUtUdkcreTdhSGMvck5NL3hUWTZNM0RqU3FPN1hNRklNMG9j?=
 =?utf-8?B?KzlNM1c4UlE4VzlNVWtyamJHbzkyNC84SHNzN0tjTWRBdEhhWStlT0xQaGFy?=
 =?utf-8?B?bEk2Q2pRMzE2VHV0ZWYwZWNta1phLzRHdXR6UWRVdjZBNnh3VmFkNjVFeDVp?=
 =?utf-8?B?SUNKM1RQWFdydWVoYm5xUU5xKzRCOXNiMGlmTkVSNWdQTC9RNmlXNmJzTzBD?=
 =?utf-8?B?N0lwTGRFNmVsVmVVcFpETFZ1RmMyOE1RVVBGSU0yVkJ0ZzhDMFFwWnV6OE1h?=
 =?utf-8?B?cXNmaXdQbHA5TmJQK3ltckZoajZRYkc2Tk5Ga1hnbERSajlDcU5zN3FmNHQw?=
 =?utf-8?B?eXZTNlBuWFVEaHllTG9oUEdRcUZ2dGtLdXNCQzFxUTNnUm9rSVlJWVVWS01Q?=
 =?utf-8?B?RTlwZmUycFh1Slc0TjRvTWlwendpWHI1QVA0WEZaUCt4eVlBQUdPanJzemhT?=
 =?utf-8?B?Nm5kd2ppQndPeEZvd0FiOVRMTHcyNTVBMUVKRVpWUitaZ3hscUFiaVg1Tzln?=
 =?utf-8?B?RUh0c0FZZ2NkMFo1ekVBWDVTQ1ZsR0FtQmpsUzMxYmV2cE9oRVZjYUNGTlJ6?=
 =?utf-8?B?UW1MVEhuZ0tzc3pvWmVBR0xmWW1QbU1jbkhscHlTWFZ4YTh5SU1TK2lOY2RC?=
 =?utf-8?B?aEI1K2VubkxoZjdld1dGRzFWTGhydlNncUJmR0lWZDRwMEZkc1Z4bVJicjgz?=
 =?utf-8?B?aFRqVDJleUZtcWI3aWk4czVGbDhyV0F1Sk0yT1RLRzRhdlF3RW1PRlZHbitM?=
 =?utf-8?B?bENJU3I5WmVZYjJuWUYwck9pUWRwY3BpeE9NaUQ3VmRzQUkxOVVEMjlMTjBz?=
 =?utf-8?B?cjhZdFpWaHlWc0syaFVZZU1lU1FWWXFNampabVlTSUMzQm9YUDlVejd6Y21K?=
 =?utf-8?B?alc2MXVNVGVsM0N0b25VSFhvekJnVENxWVpQODNncm5RUVJ3ZXBCaFdjbmdi?=
 =?utf-8?B?WHR0UU9oampMaXFtYzdlQ3BZbzRNYk5aVkVRWTVXSTlZM21xd1l0TU8xU296?=
 =?utf-8?B?d1hRejNTK01PeVZrSGIyYm1NWE9aTjduYkUxNXNWUzBZczV2aitDSVl1eDBw?=
 =?utf-8?B?NXRMYzd6amlFSGt5R0xpTjNLWWlBSnBmeVo0M2hBUVpyTHZlcVJMQTVvSWRX?=
 =?utf-8?B?ZnVBdmIvYk1hemNuODFWQ0dUSHZIUk1NMXdySXRRdElRRGNKWk5Cc0ZVRyti?=
 =?utf-8?Q?3mU05J0r0DaVxl7FktyCASMitGT4i4vJ9bLsg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F92FF60DF5AC441BE1CBB1148371A56@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HE1PR03MB3162.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77675811-e3c0-4f30-7952-08d8f78175db
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2021 15:51:07.1425
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 94f2c475-a538-4112-b5dd-63f17273d67a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UoBCZi/JNg+1Y6KQWN7w544ElW1ISGvAy9JxDv5DFAUD8d9i2SndItLtVirv+YA/rVsFRI6w4AhhT0JsaVq6PkjZpyaJzr4VxsKghfhdMEzlkjIMXKVr2SJPoj6hhFhU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0301MB2282
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQpPbiBGcmksIDIwMjEtMDQtMDIgYXQgMTg6MTkgKzAxMDAsIE1hcmsgQnJvd24gd3JvdGU6DQo+
IE9uIFRodSwgTWFyIDExLCAyMDIxIGF0IDEyOjI0OjI5UE0gKzAyMDAsIE1hdHRpIFZhaXR0aW5l
biB3cm90ZToNCj4gPiBEcml2ZXIgbmFtZSB3YXMgY2hhbmdlZCBpbiBNRkQgY2VsbDoNCj4gPiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzU2MGI5NzQ4MDk0MzkyNDkzZWJmN2FmMTFiNmNj
NTU4Nzc2YzRmZDUuMTYxMzAzMTA1NS5naXQubWF0dGkudmFpdHRpbmVuQGZpLnJvaG1ldXJvcGUu
Y29tLw0KPiA+IEZpeCB0aGUgSUQgdGFibGUgdG8gbWF0Y2ggdGhpcy4NCj4gDQo+IFRoaXMgbG9v
a3MgdW5yZWxhdGVkIHRvIHRoZSByZXN0IG9mIHRoZSBzZXJpZXM/DQoNCkNvcnJlY3QuIEkgdGhp
bmsgSSBtZW50aW9uZWQgdGhhdCBzb21ld2hlcmUgLSBvciBhdCBsZWFzdCBJIGludGVuZGVkIHRv
DQpkbyB0aGF0LiBQcm9iYWJseSBpbiB0aGUgY292ZXItbGV0dGVyLg0KDQpJIGluY2x1ZGVkIHRo
aXMgY2hhbmdlIHRvIHRoZSBzZXJpZXMganVzdCB0byBhdm9pZCBjb25mbGljdHMuIERvIHlvdQ0K
d2FudCBtZSB0byBzZW5kIGl0IHNlcGFyYXRlbHk/DQoNCkJlc3QgUmVnYXJkcw0KCU1hdHRpIFZh
aXR0aW5lbg0KDQo=
