Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5BF64CBACD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 10:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231693AbiCCJzv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 04:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231887AbiCCJzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 04:55:46 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2094.outbound.protection.outlook.com [40.107.113.94])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468CD15DB1C;
        Thu,  3 Mar 2022 01:55:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krUd7SX5bdsetuVE/2YYYx/7drjP+IWRncGV9eaCOG+hwwSGkmHqpgojxdEHr4Uz7IGfM1wuzID+joG8mFX5+7nk/bFtvrknzVOues/xW9LwrmEbfWwIgRg+BNXVsrhhhuLz8JqxaMVyqfy8CZ0Sy66YdlxLOVcz8vGagMpszZbxHXfmldMGAFdqUHJhSYUvDIpa+0I5c+eJ09U2/5mctoLFJbwLoJjzYqkltIcvYc1qK13eD6HQRQ7YCnarxy3dfPtEiV5eD+/H3AAtiT0jGIqCyXHFyQj/+bNha1/8/MAw4z8UJwgquCB6RNR5G8Xw/nfH+sRQERFAPIlqJ/5gJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lU7BBvavE2Bk1pQ/WCd8ahzUx7pBP4Yl5jKMFK2nj58=;
 b=EJPFi6ZuKIOdq8i4/nJYtIj1FOo7djWY9luPWLDYvBYdGxYwm2/dn6TSjM/3fXEVnYKQk2wLREhhCOvyJgdFR4zyYa0GMWQZyExFKaCFF0VuHNFFbOqeBnpsI52hsDv43yNVfmFcFlNG0saNINzZgjTvYLfxw7sW2m93bu4w8yVrppitapLy986K3hfYy+10FLg8h6UQesdtxld0O4iTMN7Ce9VR3ycF0nRfP+zws1UqRUGXc8cI/CuxA77uTFmuD7qVPT0C0DBqiv2kb7SpQ/TtVC96RoaDURFT5SU89PpAq635bd+auv9kGYROZ7migTdoYWgB4BZRNU/FPIhrtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lU7BBvavE2Bk1pQ/WCd8ahzUx7pBP4Yl5jKMFK2nj58=;
 b=kbhObonKI8PA7D9KGzn1zlPADHCGr/BFq3Sx51D/yZI6eC/tammqg7Rs16a8DYr73aVo2d/QLrlrvlEMffwTLknC249bcR7JG54Cm4fThvBQIRLorUgPaYKgkSeTkVE7yxXYvx6brNt/yRj0pOaNIvjcASHYw7wXeVrRn2UqI0U=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB5805.jpnprd01.prod.outlook.com (2603:1096:400:44::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 09:54:59 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::58d9:6a15:cebd:5500%4]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 09:54:59 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 1/2] dt-bindings: serial: renesas,scif: Update compatible
 string for RZ/G2UL SoC
Thread-Topic: [PATCH 1/2] dt-bindings: serial: renesas,scif: Update compatible
 string for RZ/G2UL SoC
Thread-Index: AQHYLt0EzuCwu6tP2Um67Dd/qDVDOKytXkGAgAANORA=
Date:   Thu, 3 Mar 2022 09:54:59 +0000
Message-ID: <OS0PR01MB59226DC72B72B75EBBC4E07A86049@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220303085934.29792-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdWSgjipMd_39+J=egH+yh=G-cb4jpD43FU7O77CZzDhNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWSgjipMd_39+J=egH+yh=G-cb4jpD43FU7O77CZzDhNg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b66d8b0c-97ff-4931-287e-08d9fcfbe109
x-ms-traffictypediagnostic: TYCPR01MB5805:EE_
x-microsoft-antispam-prvs: <TYCPR01MB5805614F719E3F85F8E169D586049@TYCPR01MB5805.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jbqVWk+rn2vVtAvgVr4Gro9+5tp9MEJx1NtiHR3KPYG9qAFVb+gEjhIuSkh5qYOdKwcYCYcWoqQJrmgzDpd1wcE2PFHlGXFcHpLNYy8CE1yhu2fNDf+m2hCNjIqHx4Efm2lTfGHIAro0SDPKt8qYFY0pgE6ajyto2W0Uwgxv3VTCHLBQUe4Hpv3MePjfFsXYpk0M6k0cgUo/ZppsUts1BO4APL1gKE41t5c+N7PJF75qqy06KEwvioqBdNAd6j8+hP8OwT10/Cz321XUGDf+CS5UVrxZ4zA7nIvR61AHkTEgtfgIdew3gycJzjjahFPdVyvckfb1F3pllsalCbrVEXqJtId3a5Wa6hMNprQyQ+r4FLE3FjDkm3veac+BxzveolGxY0CBAoKdO+SNayqd6vtw+gQ3TixmS+9fC5r3JalKD2vXcoPaz4/hmYa0ANeq9sFqy014BMmvtZKcER/Mrfzo7+iWpVfcLuneGdTwtr01sAflv+31Cuxgy/dj5t/BSKYXbNZuKzGRtxCz4L38DDFX7/lL3aFdTSQG8fujJe5gVM+4GNQsWPAI0Ny3FAQUUpzO66oHS7zksU1vNiZP/iRDZDkwnedbSmdv8cdMvw7hYk0hGG4A5hrX08r+lktP54GSupu9JUgDc2xlXz6nmfOlzZfVpKP81wxbSVku5yFuV9n+X4KTBr6NhMv3pZKPXK8hUXDgEknIyo9Vv0nraA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38100700002)(316002)(76116006)(8936002)(66476007)(66446008)(66556008)(66946007)(52536014)(71200400001)(33656002)(55016003)(9686003)(508600001)(64756008)(8676002)(5660300002)(2906002)(15650500001)(38070700005)(86362001)(4326008)(122000001)(26005)(186003)(54906003)(6916009)(6506007)(7696005)(83380400001)(53546011);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDdDS2tlL0lQWDJCYnd4cVA4ZWZUOFYxd2ZLU1dTOXJVMWVUNGFEenRSbXpi?=
 =?utf-8?B?akduWWEvOUF6dW82Y1VoOSt4eUZFaHYxOGJldFlqSnZSYjZnb1lKdDJsSThp?=
 =?utf-8?B?KzFGVm0zZUdhcytZbU9KRUZxc0xEUXBvdkt2L3IrMSt5VThlc0Z6Y3lZbWd5?=
 =?utf-8?B?R3VHVXJrNis2V2ZvWVJHNUh0cXdSdmJnY3V6eXBJRWxwY2ZscUd6MjFOR0R1?=
 =?utf-8?B?MFlPWXUvY3ZXSkZYQ1NTRkY0Y2Qwb0FWWjFQcVNEc0Z4cEJuNUxPaXZoaGlk?=
 =?utf-8?B?bVJZeUZOVzM1VjVubXZVUUtZRXNOZjY0QXVOTU5ON1RVcm5YaC84RjBZenU2?=
 =?utf-8?B?QnNYZWxWdFhvT0thZFA1TUJkRDhuL1hBcU5DbER6cUREMnh6L2ZjNTMyaERD?=
 =?utf-8?B?OC9OZTdJQ1NTellNUEtjNFd2VTFHak16ekVyaWRKTkNNSXJSK0pleGFNQWlL?=
 =?utf-8?B?bTVRTTlKU1hSMm53bWZHdldLNldQODVtdUpOdmdJSGs0ZWZkb1pTT2FwWDNB?=
 =?utf-8?B?WjBnQ3piQlVCL1QvVXdRTGtPbFd5amlVTjJnTWwzQkx5YlRHcElhemxTRFgv?=
 =?utf-8?B?MjByWW8rbDZZbklHbFV3MERJcVN1Vys0L0F0cmF1eXpUWDkraWloOXBLZkNJ?=
 =?utf-8?B?dDY0S1VLbm8wa0dlcE13YSt5ZHdkYjVFMDBXd3FxazQ0RHcvTTN1U0VHSi8x?=
 =?utf-8?B?SzdzY1hCeDZGL1RzcVArZTJVV3RSUG1zQXV4VkM1YmJydVluZWFwSzVMYWV2?=
 =?utf-8?B?aUMvSDNWc1dUbWxpbGhRSXd6aER2R0tNbGlsQW1BYlliOXRxMW1KTFpIQlU3?=
 =?utf-8?B?cTVMcld5QUZEZy9lR2IyKzhqZ2h4YXRYenc5ZmVPdDZnQnFyQ1I0TDI4elRR?=
 =?utf-8?B?SmlmSG5TSjhaVHBlMGI0L3pEZXBucFJqQ0p4amZIdi9xbWhHNzJFZHZzcjVS?=
 =?utf-8?B?OERqZE9odVZPMlRWWG9IaUpvaldOVnMyMlZZREcyNlNNMGw2azNGUlFiNXNG?=
 =?utf-8?B?SS9hQUtEVFFVcHFGdkswM2cwTW9GeFExb1ZGakgxOUNVL1NQUWd1VmMzMnNW?=
 =?utf-8?B?eHp6YitnVGZmS0FzMy91Q0lSTXY2dW1zRjVqSzc3bWxqQ09ocWRLNEJ1dkRl?=
 =?utf-8?B?ZllQc3k2L2FyOWJJcm1KeGw2SHduVW9UeW9LYytCa05VQU1GT2JOR1g5b2pC?=
 =?utf-8?B?SnU3UWhrdXJWSG4weDArUE9iWWsyQWtTTS9sUkFPWHFvaTNlemp0M2dpZjND?=
 =?utf-8?B?VGtFSGRIcVlHdHRpSzFweFFRcFc0QUN0REVRWWEwMzdoQXUrKy9scWpzL0Jp?=
 =?utf-8?B?Q3lDejNBOEZnNC9HN1pUYVhEcURTTlZPbDB0UGRPeGZ6ejg4blZoY0IzSkdS?=
 =?utf-8?B?VjJaVXBvVDgrNk00U2pzZ2VWQmVwV3p1T0ZMRkJBa1A3MTYrSVBZMmJ4V0J5?=
 =?utf-8?B?NmNQU2dkanpKU1lHMVlJWU9EKzlQR2FNUGJpL2o5cVpmdkJPeW8wZmhaSG5z?=
 =?utf-8?B?QTRENHRta292OXhQVkM3SmdkNFF1K2d6SkVVYzc3MlRaVDQzUUtIMlRRdy93?=
 =?utf-8?B?SFQ4Y1p6UmtKUytrdDFnd1BIWUw2Rnl5dFg0bXZaV2k4ZXYrc3JlcGhqUnFR?=
 =?utf-8?B?bTlZQlU3bHZNdjZzUGpzVUNhZDQvaVJWUkRRMjZsRlRnYnRlNUhNWFpqQ2o3?=
 =?utf-8?B?TmRjVjNhdVJlSnU4aGJrazUrMjhqYXR1V2QwRytNRFlOYnEvdFFDTGhqVXBo?=
 =?utf-8?B?MThmL09DUW12TDBIcXM0cVJXcVNWYUt1cnVPQVptckgwNjUrYWZPdzkrT3VR?=
 =?utf-8?B?a0p1SGZ2Y0tiakVLVUtzMzU4aTdIa3VibGRqcmJibmNXTUI3dVFuVmJUeGt4?=
 =?utf-8?B?Z2tkMmtHeTNBQVY1T0cyNldncE94M1J4TVFSTys0N2FyYWhoRUFRdDMvWnEx?=
 =?utf-8?B?YUI1emZsNElsbm0rc1ZsTlRQUFNDTjZIUlBURFAyUk1MaWh2WVl0OExjUkhv?=
 =?utf-8?B?dHVhSDdobVpOWGFSby9VcWVWMlhpT1lkSWcrMmhQVGJOK3RQL1JuekpsMlBr?=
 =?utf-8?B?WGYxUFZHODhhS25uM1F6Z2tVOVB6dnQxNE1lYkNhMXlhOUdDRHRHZ0E3cU1Q?=
 =?utf-8?B?dHJsM3FQQkJ4c2pIMTBqUDZIa0ViTmQvYm4vWkJYS0oyZjFHSW4xb0s5RGVt?=
 =?utf-8?B?aHFlTDczdXg2REU1SnZsNzFFWmNkbERqMWdYT1hXUytvWS9sRUd3YU1NQ3Zu?=
 =?utf-8?B?aXhWZTAxekJBckpaYTdHNnZpNnFnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66d8b0c-97ff-4931-287e-08d9fcfbe109
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2022 09:54:59.1319
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FpKnX54DsOBBh8YOJFAFqNZfxKpU5Ypu04ikdy2mf2R0W2hMUUxYemfuXHa39SrKY7X6DTntyHs7bonFQp6BGA9aQUhM05dwMMzGtc2/dRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5805
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrDQoNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCAxLzJdIGR0LWJpbmRpbmdzOiBzZXJpYWw6IHJlbmVzYXMsc2NpZjogVXBkYXRlDQo+IGNv
bXBhdGlibGUgc3RyaW5nIGZvciBSWi9HMlVMIFNvQw0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9u
IFRodSwgTWFyIDMsIDIwMjIgYXQgOTo1OSBBTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IEJvdGggUlovRzJVTCBhbmQgUlovRml2ZSBTb0MncyBo
YXZlIFNvQyBJRCBzdGFydGluZyB3aXRoIFI5QTA3RzA0My4NCj4gPiBUbyBkaXN0aW5ndWlzaCBi
ZXR3ZWVuIHRoZW0gdXBkYXRlIHRoZSBjb21wYXRpYmxlIHN0cmluZyB0bw0KPiA+ICJyZW5lc2Fz
LHNjaWYtcjlhMDdnMDQzdSIgZm9yIFJaL0cyVUwgU29DLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+IFJldmlld2VkLWJ5
OiBMYWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+
DQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJpYWwvcmVuZXNhcyxzY2lmLnlhbWwNCj4gPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL3JlbmVzYXMsc2NpZi55
YW1sDQo+ID4gQEAgLTc2LDcgKzc2LDcgQEAgcHJvcGVydGllczoNCj4gPg0KPiA+ICAgICAgICAt
IGl0ZW1zOg0KPiA+ICAgICAgICAgICAgLSBlbnVtOg0KPiA+IC0gICAgICAgICAgICAgIC0gcmVu
ZXNhcyxzY2lmLXI5YTA3ZzA0MyAgICAgICMgUlovRzJVTA0KPiA+ICsgICAgICAgICAgICAgIC0g
cmVuZXNhcyxzY2lmLXI5YTA3ZzA0M3UgICAgICMgUlovRzJVTA0KPiANCj4gSXMgdGhpcyByZWFs
bHkgbmVlZGVkPyBBcyBmYXIgYXMgd2Uga25vdywgUlovRml2ZSBhbmQgUlovRzJVTCBkbyB1c2Ug
dGhlDQo+IHNhbWUgSS9PIGJsb2Nrcz8NCg0KT0ssIEp1c3QgdGhvdWdodCB0aGVpciBERVZJRCBp
cyBkaWZmZXJlbnQgYW5kIHRoZXkgdXNlIFJJU0MtViBpbnN0ZWFkIG9mIEFSTTY0Lg0KSSBhZ3Jl
ZSBpdCB1c2VzIGlkZW50aWNhbCBJUCBibG9ja3MuDQoNCk1heSBiZSBJIGNhbiBkcm9wIHRoaXMg
cGF0Y2gsIGlmIGl0IGlzIG5vdCByZWFsbHkgbmVlZGVkLiBQbGVhc2UgbGV0IG1lIGtub3cuDQoN
CkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgICAgICAgICAgICAgICAtIHJlbmVzYXMsc2NpZi1y
OWEwN2cwNTQgICAgICAjIFJaL1YyTA0KPiA+ICAgICAgICAgICAgLSBjb25zdDogcmVuZXNhcyxz
Y2lmLXI5YTA3ZzA0NCAgICMgUlovRzJ7TCxMQ30gZmFsbGJhY2sNCj4gDQo+IEdye29ldGplLGVl
dGluZ31zLA0KPiANCj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+
IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtDQo+IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRp
b25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4NCj4gQnV0
IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIg
b3Igc29tZXRoaW5nDQo+IGxpa2UgdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAtLSBMaW51cyBUb3J2YWxkcw0K
