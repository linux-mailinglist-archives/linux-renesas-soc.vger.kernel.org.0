Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED6FB4E5489
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Mar 2022 15:49:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236316AbiCWOug (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Mar 2022 10:50:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229863AbiCWOuf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Mar 2022 10:50:35 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2113.outbound.protection.outlook.com [40.107.113.113])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E497CDED;
        Wed, 23 Mar 2022 07:49:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B9Yo5funEFzxYj41TVWdaYoHspmL7KPm6BspcuPqdTib9TBf2AcwchjlBb5kxOw5pHgiDQFfAA6HQg5mSwL6EJHENlf86F6LM/M6wCjDe/8ndg4/Nxe74B/cNGQxmXguW8Qx71SpwB8/UddJJpxX17Blt911wyLjlxmSUS8tNrljMOZg9kwVbUnc2OzcJwQKNGYHsmImoe3yhki5jqpQGQa3x1QpjbPSZITYu7jdw+o08a5ZxSGz17qO8YTcjbvQakgiYaSdMU/5sGk2vX08c0fZRT8UIwFgnEJL06p7/JiiRjKLxDN7zCOZEDBWYmU2FTfurr+/5+Ppufvdt3Ff7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lpp2szjqKbafYf8Gwblp3A7l0lbVykRSIzgZt1lDbYs=;
 b=YjzVERRYOiJ8uE5DnwIcF2JX2HKiCi3ItHqvvfQukH9ok1tlC7Yta/9JuGu99hXIXewuXF84Ze10+E/13LcpFgfnV0pwwx7X16Qi3Z5kAa14eWAjmwWNHf9igNZ4Mfq67gZ1mF5Yyib2+FH7p8c7iLJ8ItlF/72/jFfeNFUmrks1IE2iQvCSs2X3AH0AvrlqMU9Ra0vow5Ffb305Hb9rZplWUgGHISJdi/kHKWgcrmnQJNTx0thmRbA9q9HTByOtRVGoDhAMfl5kLlgVkCbyGkqG8IEtJXdaX2g11kCNPPQe/3QTM5pRrjfvHu5PhG3bRfIGD4AW9Ieu/1I4mUtJlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lpp2szjqKbafYf8Gwblp3A7l0lbVykRSIzgZt1lDbYs=;
 b=dcEkN9UsM/LO2mz7qiyWiH36cJFb3Sh5va/EEij8FFOjyYbtOpYnbewqrH10Xh1FNp8zbNGJwiENuc2bUuulMBefarmBhh2NeluIq94gdE98BU5N3SpYhYAVYxzI7g3UALgsl9qt3XkLJcuw/CKfES+NuvmsSDK29j7a9dHC3nY=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSBPR01MB3831.jpnprd01.prod.outlook.com (2603:1096:604:47::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Wed, 23 Mar
 2022 14:49:02 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::7120:d44f:518:6daa%8]) with mapi id 15.20.5081.024; Wed, 23 Mar 2022
 14:49:02 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
CC:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 03/14] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
Thread-Topic: [PATCH 03/14] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
Thread-Index: AQHYPTpwweykXxtPLkGWTHuzMJ57DqzMyuUAgABEiVA=
Date:   Wed, 23 Mar 2022 14:49:02 +0000
Message-ID: <TYYPR01MB7086AAA429577934DC7D89BBF5189@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
 <20220321154232.56315-4-phil.edworthy@renesas.com>
 <faa4c924-a523-a02d-3fc8-7333e46c4038@kernel.org>
In-Reply-To: <faa4c924-a523-a02d-3fc8-7333e46c4038@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5db6e2e9-5de3-47a2-04c9-08da0cdc45ab
x-ms-traffictypediagnostic: OSBPR01MB3831:EE_
x-microsoft-antispam-prvs: <OSBPR01MB383132D3E5ACF9BF04C2B5D9F5189@OSBPR01MB3831.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bkDKUTIuSMaKCfPUsZWpwTpU+WiCws+xYiq+Ikv4/sAPHPG+wNsmahFSpdvtwcuu+gzsOn3/eR4CChqMW/kDAvnJxSF/bls+aQGBhWQo9CXctfNjrO6Ww2tDVpzJB2klg5MbCq6Nh3C+retNhaYNIcUcAZIdMsExrO12rsXkUqFFlF/kNjdBVJHV7CErapE2GMLx4DXqKxzP03zR1/589v+A8gtEKF7ZFfDYuyejDpUXL19UziwFKKfFTff8X4eM759I2xD6Zv+Z3Mwp5rHKI6VS0wuQf39cUA7AJDRHSGpi0697SlAEHNqam5A6lN1cPI3Q0n13hzaY5Zw3GmB0mCpnxi4bKSCckhWcZAwkBi46yPD3AEurNLMpQV6sHkhQ07jnU1F0sg1FJoFnnDOrgDG0HzUJzcY9miLTbQ7aJMjQrCWrSmBg7Pfujasup07AGPHgHSlkpyr2cEWzrv9on3KqW/zKWos3oyXA6MfuC1fZ46fPI2ZdsYHYItyhGClR9nx6ZE22qXs5ek/Gq8xa6RyvkUxrhqsDRNaJw4oFg40dW1tLOAwk4fwz3Y+o062WEDVxc7oBtUgJnWT0+rIxekVHcdcChgc/csk78t/g6IX/xrahPHS0mzbwrowKRnEuTFFU2MySdPIpiql4NrrrV7AQINSdhfJFyAcShaM0URcXkDXdvN+VZWMKidg3yqDM3fPz6R05hbgTkozHr/4NNw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(508600001)(107886003)(186003)(55016003)(26005)(38100700002)(122000001)(83380400001)(9686003)(71200400001)(38070700005)(6506007)(7696005)(33656002)(316002)(53546011)(110136005)(54906003)(2906002)(86362001)(66946007)(8676002)(76116006)(44832011)(4326008)(66556008)(66476007)(66446008)(52536014)(64756008)(8936002)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?V2c3dExicUVDRDZIeVhrYUJJb3Y5cGFsUTlKTklhWU9zazFGOFFTcDZuTVRN?=
 =?utf-8?B?bzZRbmxVMDhteUgrWVVQeTVPSVQ1cDVLL1hxb1NIS3JJUTlmdlpua0NsQUVw?=
 =?utf-8?B?bzNNMXk4THBLZzQrT280OWpuSFZ1NkdUNHBFUURQU1lHQzVaY3dEQXU5Zmxh?=
 =?utf-8?B?cXpnZThFNWNTTmZTeFVPaWFvcVkyc1lETW5GL2crdUNmN2wxYXg0S3IyUXNn?=
 =?utf-8?B?emRLUGRtbnRPYXhJMHd5TGpmVENiSnVQOGZDcTYxSEIrRUx3WGw2VGUreEMy?=
 =?utf-8?B?UTUydHJrZXZKY3Npa2pJMVAzMmppTk0xYjRDaTVYR092cFJuMzFMUVFuRjdK?=
 =?utf-8?B?VUlwQ3dQd2ljTDVZNWtBNittSitZaHdlVFhsV01hSFpzbXZWZzBkdkFsSDRD?=
 =?utf-8?B?Wm9nSDd6aUREeUU0NW5QNDlYWHlaOFFCWmhBRUczc1B1ZXZvUlpCL0RFZTVv?=
 =?utf-8?B?czNRREk4S3VlYjBzS2E1M0kxY293clV3S1NDTXBlWUxqcmpiRm4wS3BEWFNF?=
 =?utf-8?B?cXBlZGJiRFFZZE1oVTlRSk5uek12VTZDUk9jenA0M3J2elNjMHpsaFF6WUFy?=
 =?utf-8?B?UUdRVU0wVFR1a3VBVzVoUEszdmswUHg5T0d6V0o0a2dlbThyeUZRZE5ybWpH?=
 =?utf-8?B?bkxZT0o2MENrY21aUWNoUDZud2pVN2Ryc1VZa1dCU09PZmpXdHQrb0J2WGlh?=
 =?utf-8?B?bVNIcGFnLzVVd05qQWtmc0Y3d1Njc1dsTjJ6U1BuaERhajZ4NHp0NkowamZL?=
 =?utf-8?B?OGJtMUhDTmNBQzBOanJFSlkzNlVMOGR2MG9zbW8yRHFsbTdjUlltcUxFczl1?=
 =?utf-8?B?RWoweXVOK2M2cVkvc2xISi9UMUsrN0g1QjB6dW81UlJBODJ0OFNuNmZYc0c5?=
 =?utf-8?B?YmU3Q0pvUXJ1ZkV6VkZWeEhVcS9INmdvYmc0TElxVUFtUFJ6cEN0T0VjR2xp?=
 =?utf-8?B?TGJhbFlrRTN2UjVwdnlsaFhkd2Y5Z0g1K0lEaTVpRlZTL0tmWGtPQTNhKzd4?=
 =?utf-8?B?UFd2M1cwYWhWNmtKczdSZmtHbEpSV3krUzJ6dmgrNXFJUytjYldzN0N5WmpJ?=
 =?utf-8?B?bURVYmFJODFtYkNpNXFzSHIwa20rYmVCT1plM3M4Rkl5NUxLZjVaVkRndk9k?=
 =?utf-8?B?cWZvN3lZN2hGbkF4YzZtc3kzTWh4TlJjYTlSakxHaUVYcnZuOXdaSysrUGJr?=
 =?utf-8?B?VWNrbG5HNHp0R2VaYTRhUGZ0cVZqTDF4TDZ6MFNkTlFSbVZHS0cwK05FK0pp?=
 =?utf-8?B?eGNmQW1kVFZmVVB1NDdYRnhYYmZyKytpaDdsNGxHekw5MGN2WWFzRWxtRllO?=
 =?utf-8?B?MEFiWlJ2Ny9pMG1kakg4MWQyMThkMTlXaUswWTAxQ2YraExKRGVxU0VpMGpB?=
 =?utf-8?B?dFg5NDhsMW5vYmR1WksrYWF6b0xGTTBCY0xNOTNtVktLL3pseHQzVVVuMy9R?=
 =?utf-8?B?TTRnVitGWGVyWG1ITFpCTTZWTm11YnBrbTNGNUpqdG9QN3JZL2ZhSWtuRWdI?=
 =?utf-8?B?VDNmZDVHR0IwRFVtbGZkekNGUFlvU1BMVDRMdFdUb2VUYWpBWThhVSthaFBo?=
 =?utf-8?B?SXpySFlHMXNQVFo2SENISlFZclNDbmdnSnVQSkxwUnJmdFh2L0F2czJvTGVL?=
 =?utf-8?B?MTd1d1piVXRQaGxDVXd0TGNTRWR6MFk4RzlUSEVZNUtkSURJVUZjbXNpTUJW?=
 =?utf-8?B?VE1tblFmM0UrMlNaUEpXKzdCS3RyODRBMkxiNTJwcERFT2lOZlVQTUQ0Z3B3?=
 =?utf-8?B?MFhNWjc3R0lkNnpMWEdmUlJDSXJzRW5JYWVhVTlTQU9TVWNJUmd5ZkgzVzcz?=
 =?utf-8?B?dlh3RHd4SXo1YmtkRllHSldkQzBKZG5lRVRuOVBGZE4zU0FSc3hLVGxXWjVS?=
 =?utf-8?B?RUFzZ2xxOFkwamxkYnJCdzJuK0pPRXVkaUU3VEJ5VS9BSDBOSngvdW1xS3Ba?=
 =?utf-8?B?N0NDTnJrMERvVm5aaVhldGtuM3BjQnNKTnhhNWV3TVcxdy9QUGxjSWZ1Q3Yv?=
 =?utf-8?B?aTliVDIvc2pnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5db6e2e9-5de3-47a2-04c9-08da0cdc45ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2022 14:49:02.6896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7x5HAAg6UR/xGCW8Onf6VRWgWHvKHhNA7orSF7YYnjaWZ4hXlJOd5PyRNmXC20zqAuZWe+mWk990Ib4+2sIWGtfikf5Y+tAK+SrSxltNKY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3831
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiAyMyBNYXJjaCAyMDIyIDEwOjQyLCBLcnp5c3p0b2YgS296bG93
c2tpIHdyb3RlOg0KPiBPbiAyMS8wMy8yMDIyIDE2OjQyLCBQaGlsIEVkd29ydGh5IHdyb3RlOg0K
PiA+IFRoZSBSZW5lc2FzIFJaL1YyTSAocjlhMDlnMDExKSBTb0MgdXNlcyBhIHVhcnQgdGhhdCBp
cyBjb21wYXRpYmxlIHdpdGgNCj4gdGhlDQo+ID4gRU1NQSBNb2JpbGUgU29DLg0KPiA+DQo+ID4g
U2lnbmVkLW9mZi1ieTogUGhpbCBFZHdvcnRoeSA8cGhpbC5lZHdvcnRoeUByZW5lc2FzLmNvbT4N
Cj4gPiBSZXZpZXdlZC1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+IC0tLQ0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxlbS11
YXJ0LnlhbWwgICAgICAgICB8IDYgKysrKystDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsZW0tDQo+IHVhcnQueWFtbCBi
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxlbS11YXJ0
LnlhbWwNCj4gPiBpbmRleCBlOThlYzQ4ZmVlNDYuLjQyNzMzZWFhMGVjZSAxMDA2NDQNCj4gPiAt
LS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsZW0t
dWFydC55YW1sDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nl
cmlhbC9yZW5lc2FzLGVtLXVhcnQueWFtbA0KPiA+IEBAIC0xNCw3ICsxNCwxMSBAQCBhbGxPZjoN
Cj4gPg0KPiA+ICBwcm9wZXJ0aWVzOg0KPiA+ICAgIGNvbXBhdGlibGU6DQo+ID4gLSAgICBjb25z
dDogcmVuZXNhcyxlbS11YXJ0DQo+ID4gKyAgICBvbmVPZjoNCj4gDQo+IE5vIG5lZWQgZm9yIG9u
ZU9mLCB5b3UgaGF2ZSBqdXN0IG9uZSBlbGVtZW50IGJlbG93Lg0KT2sNCiANCj4gPiArICAgICAg
LSBpdGVtczoNCj4gPiArICAgICAgICAgIC0gZW51bToNCj4gPiArICAgICAgICAgICAgICAtIHJl
bmVzYXMscjlhMDlnMDExLXVhcnQgICAgIyBSWi9WMk0NCj4gPiArICAgICAgICAgIC0gY29uc3Q6
IHJlbmVzYXMsZW0tdWFydCAgICAgICAgIyBnZW5lcmljIEVNTUEgTW9iaWxlDQo+IGNvbXBhdGli
bGUgVUFSVA0KPiA+DQo+IA0KPiBEb2VzIG5vdCBsb29rIGxpa2UgeW91IHRlc3RlZCBpdC4uLg0K
U29ycnkgYWJvdXQgdGhhdC4NCiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoN
ClRoYW5rcw0KUGhpbA0K
