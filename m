Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3BCB5795B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Jul 2022 11:01:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232002AbiGSJB1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Jul 2022 05:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiGSJB0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Jul 2022 05:01:26 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2106.outbound.protection.outlook.com [40.107.114.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6000911834;
        Tue, 19 Jul 2022 02:01:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DbfYbe9kER0BJ67AK9NUWfyNgr37oV6TltyKXEshS+8GjGP31HlmegiBKmT5+j2DaNsxiV32HyRS2FTGUveCFWm9XvlcUUI+87zxmUQwzbDoVFq1gISCvwoOWPhtCFWuHSssBLNueNX7jS8NUY2f50DgqURWi5Dzu1qJ8agNOvolePIi3DZnaL9LsvZhN1UW9BOxNLNtFJpiKgu40FVgShxRwHn8SXaXAhweP0Vls3GOR+/8h0/0CzgaQAh0Qkm0r0W47Cswa9dcZOa5BD7OiYALT9TYuka28WgmBtzZ0iU2kERz/XWXmO2dn0FhyOU6ykR8IWph2X0+4FkbVRvrtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GH6tjGIH79qtBzCM1TRImMJOAKooecru2MK8aZ7fHGo=;
 b=Nj0eRpWeBwbjmUfXPab3VuWpvyebJk6AB5c4hpvgraiNhp3HoFNieBwQ4GaM5dcNvgZWBW51wKVPQZG2CUU+dPmdk9UXyINsrAIUnnPbfUHiYls5SekSU6QAQ6uVSP0qRTDSgG8Qe/RqMI8t4xZBbNe5o7UoqPZ02usFsGFBbRRN0bV8sGt7QIHjdyXIBPGzRbhcSAB8RRK0vzagsdgLlWG6RJeEzi0WyG22p22D0t+A5e0RJt9NeVM11SF0TxsUgp+tH1wn79GHQhCjl/lKXY5Af+sh2txOis4uzDd6/MmPGCH29hb3qDnDD4nJKjSsHWGu6My7f8m8AyiUQhCvuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GH6tjGIH79qtBzCM1TRImMJOAKooecru2MK8aZ7fHGo=;
 b=k5uV4VE9+iZfZg2IYXKgg5okNJW6+0Mp+k4KpgmSTHsWogqyyhMAU9TqajTLZZurT8OpMtEapSB+KOU9uxF5Q52MUeF81qtY14KwLA2s5AC5QpAxLRSsAubHe2tOfGTMbcehEI8y6Q251TSpxVr1ec1+0DWYINq6LUgk7+RESZo=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by OSZPR01MB8864.jpnprd01.prod.outlook.com (2603:1096:604:15d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.15; Tue, 19 Jul
 2022 09:01:23 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::3c36:680f:3292:4a79%9]) with mapi id 15.20.5438.023; Tue, 19 Jul 2022
 09:01:23 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: RE: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M
 r9a09g011 support
Thread-Topic: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document
 RZ/V2M r9a09g011 support
Thread-Index: AQHYmqydoo0CM3aRukCI8TxnX3l0a62EJpuAgAATSeCAAQTSgIAAJgEA
Date:   Tue, 19 Jul 2022 09:01:22 +0000
Message-ID: <TYYPR01MB70865ABE033AAA53FB228FFDF58F9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
 <20220718134458.19137-2-phil.edworthy@renesas.com>
 <40224cd7-0e71-7f5a-47c8-142539312f21@linaro.org>
 <TYYPR01MB70868B846CAB2F7124148771F58C9@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <b26f2353-c5f3-16f4-11c8-63068baeada5@linaro.org>
In-Reply-To: <b26f2353-c5f3-16f4-11c8-63068baeada5@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1b6f3ce-7259-4d19-de5d-08da69654113
x-ms-traffictypediagnostic: OSZPR01MB8864:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PQDtynHAiIGsUkrMRAksvj1qw7U+ebRQeUMqPI4R4fLcQn0T/jjXHH0oy/Cg3UquSeA2MC68Lyg7zKRB5jN1UAsQbm1TpaaakLBAf795slTLATU0rmZriCBUdxwQoN5/fINjNHDAE8/SlfeDrhoOMFv/0aDRjoYpqxF+LvL+z2ZWec9xWElS0WlV5gq2Q8ZIXFxLPgs2jrdhPGige8cdlLSpnc/5wG7/Q+qMZTSQpJMKGe/dGE8ADH+Ezl6AYCZOff/zAA7PTFRyIXSEv0irPhyOpvFzySBGeOiUH6KY0TNG3v1wi6KRLRSK5kJRlzg6TFe4ykOcfDk4CGHVsdF5CzxxHfwCA2Pfy/pwYRF6JCxCVSiZRc6nBGf5Wsi2j3ClrxVUCiFccoz5jVoiK7oInE6CrPZvPIDS8LoE6J9HR+8kxFmci0P4Kp44KFKfJoGnAz7tjUlYYz+yNfsdmn8rp73ZSlwSrsivxkvgyt7WbxbOjsduRSBCWVbdNMKaXy0SzccT6JMtGz27g8dqoh6Yz20msJ+XrNpDC/4fUV49YBW2jHSkHRG44Gxg3adxmKA7aJRsDh55YJwOBkJmcguvJ/vvR/9JBwJtj9XwDvNzeVcJjFckkPoZTL5pYIei5yk6ltxmpYVz/jnt1FxqhYELgee9RbEG1OF07qoe+cK5/iMqgT1QErlbTpbO9dx9ZyKbIu6PlXfRmzQac7StrsbeJzwZ7sIR2n9iUYnplEw8l36VyAdDAk4dJ/RggeuMTesbLqlRLkYbvhFNfALcy5tuFRf45M928ARPED8HrpQS7w1H8YYu+UA0arcKabtKJth4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(136003)(39860400002)(366004)(396003)(346002)(478600001)(110136005)(66556008)(8936002)(52536014)(66446008)(8676002)(4326008)(66476007)(71200400001)(66946007)(76116006)(86362001)(64756008)(316002)(54906003)(38070700005)(44832011)(7696005)(6506007)(5660300002)(26005)(122000001)(41300700001)(9686003)(38100700002)(2906002)(53546011)(33656002)(186003)(107886003)(55016003)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bWtzUU5IS01GR3dNMHNIYXh2cUljREVoTzJjR3N1Smg5amprY0QrNjA3S0lT?=
 =?utf-8?B?RnE1eXhpVTVlTEFnZk00WGdzN0VHTkJXL2RoQ3BEaDVtUDVtM2ZsUTVXQ1Y4?=
 =?utf-8?B?Skw1UkJ5V1pTdFFjbVZXTzNxanRzR3p2SmE5RWh1MXkreGU4TXVxV0pONk0z?=
 =?utf-8?B?WlhORUE3ZUhUaG9ZMURlb05CbkE3SnA5blNlMHVIVHlWUHVuYWVPWDFkZHkv?=
 =?utf-8?B?TEViQUNkaCsyaHZlaXJSdzNOblJYUDRISEFoSENmcURVMldHd1AvV2RLNlRH?=
 =?utf-8?B?aE9JNjdrUzFhWmhoYXY1YWJEcWlOdjNCZTlMY1g3Q09wNTNHSERUR2FXY1FZ?=
 =?utf-8?B?R1ROaExqbFhseExOLzJNbU9IbFhFU3U0cjZRbTRldG8vK0lNaU5sK2RPc0Qr?=
 =?utf-8?B?S3RVQmt2M3Q4OE11U1l3UmtJVXUzSlZlUGZ4OVUrMFJUOGR6cTdyeTVtWlZ2?=
 =?utf-8?B?dGZITktDZGVUckJDMGFkendWd2tXc1FFSDZaZlkzTGptTWhRR2ZDMFRUZ2l3?=
 =?utf-8?B?RWI4bHlkbFF3RExCbDlUNytxR1p2aitGQXJ1RE1Ba1BJVExvL1p5QlJMMVl2?=
 =?utf-8?B?VGNIQXRJc2RTY3M4UitHVTBBd1liNHVqT0RNSy9PSGRiZktsZUFjU2ptVEVa?=
 =?utf-8?B?NnQ0SEYwRFVvanVjMlZKQktGbjJybnI2K0o4S2NxalRIL1YvR09uTUlCdkwz?=
 =?utf-8?B?bk1vUnRLeTlrbmZQSWRxKzBYbENLR2hma2U0cDNjdzg2ODJLWDYwVlVpSFRw?=
 =?utf-8?B?Z2t3aFoyUldkUzFvMElzMnNzS09zT04ya0ZwRzZqZHZxZkxTa1N2bGs0c1Ay?=
 =?utf-8?B?dXdhQ2ROdzh1dHRNV0N3VCtGM2tvd3Q2TzZWUm1wM1hEb01mT093eHJjdGkv?=
 =?utf-8?B?WlhXQU5JckpJMW44VXlHSGpqaGw2bmphb0RmU3NZYUxTWXpZY0MvRnIvVEpx?=
 =?utf-8?B?VFJDVExyL0ZCYnViOVZGdHF1U2VWRlVCL1hTeC80c2dQVjRmU1ZYQklnVUJt?=
 =?utf-8?B?STl3YXhyVDZpaDNnUjArbUwvVWJodEN5aEh5QjhRV0xjTFVSZzlaK0RUcCtE?=
 =?utf-8?B?bXN3SXpXWURwOVJQMXMxNjBOZDNvZnUvQ0RMUDJVa3RmWndFRTlOZUMxRjlo?=
 =?utf-8?B?cjdadzJVajZrVHYvYlFxeit5VGxGQUpwSm96QzBhbUo0WGtvdlA0eElJVEVm?=
 =?utf-8?B?RFh4Z2NHUG55eXJ6dzJhSFlMS3ExUFNIQ0RBLzQzcVoxQzNiUmRTV1o1STAx?=
 =?utf-8?B?TzhTU3hjVnBBbkY0enREcUhjUnFqK3lFeEVJS1NKMzFycWVhMHFHZzVqNjZU?=
 =?utf-8?B?ajFhb0N1ZXFpTXZOOTlNcElONlVWdWxwTXdNZ3pQck5GR2ZUUHQ4SmtXVjNH?=
 =?utf-8?B?eFlvYjBUVnNmNVZ5NjNRemlUdlJ3a1hiNGNZbXZha0JRT0pYK25NVW5wWnYr?=
 =?utf-8?B?K0VneGx0eSs3WEdFemJRUkNJdlo3Z3hIZ0h1Yi9wUnF4Z21DM09nWG1aOHl3?=
 =?utf-8?B?cStoWlVqV2pPT09uNFVhSVZCOFdDQnk0Z3hHbXlGVjBRdERCQ0tKRnJML2Y4?=
 =?utf-8?B?Szg5RXBYelZUSlJQSit3WjBRbFRvWEVrMHNvcjg1STVOY0s2WlBCZU9RS0JZ?=
 =?utf-8?B?eExrQ3hBaTRhcU1YTWsvVHVRMk81eDZ0Ynl3dGRMUGp3Qm9CUWZiclJLeWpw?=
 =?utf-8?B?Sk12b0NIeStYa2ZVQVFWbm1ub2V1UVJMendXSDJVc3NyWjM5VFRSbHpINXph?=
 =?utf-8?B?Y2o1S2VLRHJ2NnNPaFJJei9xMENPUEFwa0xHclQ3bUlpY3VYYUZNL3djeUts?=
 =?utf-8?B?QjBQTFRhKzRFQ1NQUHFtMGJESk9yRTRQWVI2ald1a0VqM0VQVEdUODQ5dzRk?=
 =?utf-8?B?b0ZwcWY0bjVOS1g1STJBVEg0dW9UN3hCS2t0cTFDb1BTSHUzTTMza1BFK3pJ?=
 =?utf-8?B?L0ZBS0NyQmQvZkl0cFBsbnlnUWFhcDJvQ2VobFpoWUdORnBrTzEzSFFLeVQ1?=
 =?utf-8?B?REc1YnEzUlNKRG9HSUZ1NUkybGNaVW45eUxrQ2oySTkzdnpxUXpyRmdvTTlh?=
 =?utf-8?B?Kzh0YWFGL1VHa0J5UzM0dUt6Smk2VTRjY3RaU1ZvZHBHcitxZWVNWEorYWEz?=
 =?utf-8?B?cktzNTM2dS9KdjJwdU1DRTEwWFo0enJEVHhrREVvSmlUQ1Qrd1JNRzUwdUxr?=
 =?utf-8?B?blE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1b6f3ce-7259-4d19-de5d-08da69654113
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2022 09:01:23.0624
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHkkOJensCvM443tMYdeybYb0dJm4nfemgBdam1P54JMyxksUdwfFBYj0gJhw/1hJsqw01U/kV5tHodoeJ4g5TKswWJwZcaDV7Oc2Ict5bA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8864
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SGkgS3J6eXN6dG9mLA0KDQpPbiAxOSBKdWx5IDIwMjIgMDc6MzggS3J6eXN6dG9mIEtvemxvd3Nr
aSB3cm90ZToNCj4gT24gMTgvMDcvMjAyMiAxNzoyNCwgUGhpbCBFZHdvcnRoeSB3cm90ZToNCj4g
Pj4+ICAgIHBoeXM6DQo+ID4+PiAgICAgIG1heEl0ZW1zOiAxDQo+ID4+PiBAQCAtNDMsNyArNjUs
MTUgQEAgcHJvcGVydGllczoNCj4gPj4+ICAgICAgbWF4SXRlbXM6IDENCj4gPj4+DQo+ID4+PiAg
ICByZXNldHM6DQo+ID4+PiAtICAgIG1heEl0ZW1zOiAxDQo+ID4+PiArICAgIG1pbkl0ZW1zOiAx
DQo+ID4+PiArICAgIGl0ZW1zOg0KPiA+Pj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFBlcmlwaGVy
YWwgcmVzZXQNCj4gPj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBEUkQgcmVzZXQNCj4gPj4+ICsN
Cj4gPj4+ICsgIHJlc2V0LW5hbWVzOg0KPiA+Pj4gKyAgICBpdGVtczoNCj4gPj4+ICsgICAgICAt
IGNvbnN0OiBhcmVzZXRuX3ANCj4gPj4+ICsgICAgICAtIGNvbnN0OiBkcmRfcmVzZXQNCj4gPj4+
DQo+ID4+PiAgICB1c2Itcm9sZS1zd2l0Y2g6DQo+ID4+PiAgICAgICRyZWY6IC9zY2hlbWFzL3R5
cGVzLnlhbWwjL2RlZmluaXRpb25zL2ZsYWcNCj4gPj4+IEBAIC03OCw2ICsxMDgsMjcgQEAgcmVx
dWlyZWQ6DQo+ID4+PiAgICAtIGludGVycnVwdHMNCj4gPj4+ICAgIC0gY2xvY2tzDQo+ID4+Pg0K
PiA+Pj4gK2FsbE9mOg0KPiA+Pj4gKyAgLSBpZjoNCj4gPj4+ICsgICAgICBwcm9wZXJ0aWVzOg0K
PiA+Pj4gKyAgICAgICAgY29tcGF0aWJsZToNCj4gPj4+ICsgICAgICAgICAgY29udGFpbnM6DQo+
ID4+PiArICAgICAgICAgICAgZW51bToNCj4gPj4+ICsgICAgICAgICAgICAgIC0gcmVuZXNhcyxy
enYybS11c2IzLXBlcmkNCj4gPj4+ICsgICAgdGhlbjoNCj4gPj4+ICsgICAgICBwcm9wZXJ0aWVz
Og0KPiA+Pj4gKyAgICAgICAgY2xvY2tzOg0KPiA+Pj4gKyAgICAgICAgICBtaW5JdGVtczogMg0K
KyAgICAgICAgY2xvY2stbmFtZXM6DQorICAgICAgICAgIG1pbkl0ZW1zOiAyDQooU2VlIGJlbG93
KQ0KDQo+ID4+PiArICAgICAgICBpbnRlcnJ1cHRzOg0KPiA+Pj4gKyAgICAgICAgICBtaW5JdGVt
czogMg0KKyAgICAgICAgaW50ZXJydXB0LW5hbWVzOg0KKyAgICAgICAgICBtaW5JdGVtczogMg0K
KFNlZSBiZWxvdykNCg0KPiA+Pj4gKyAgICAgICAgcmVzZXRzOg0KPiA+Pj4gKyAgICAgICAgICBt
aW5JdGVtczogMg0KPiA+Pj4gKyAgICAgIHJlcXVpcmVkOg0KPiA+Pj4gKyAgICAgICAgLSBjbG9j
ay1uYW1lcw0KPiA+Pj4gKyAgICAgICAgLSBpbnRlcnJ1cHQtbmFtZXMNCj4gPj4+ICsgICAgICAg
IC0gcmVzZXRzDQo+ID4+PiArICAgICAgICAtIHJlc2V0LW5hbWVzDQo+ID4+DQo+ID4+IGVsc2U6
DQo+ID4+IG5hcnJvdyB0aGUgbnVtYmVyIG9mIGl0ZW1zDQo+ID4gU29ycnksIEkgZG9uJ3QgdW5k
ZXJzdGFuZCB3aHkgd2UgbmVlZCBtaW5JdGVtczogMSBmb3INCj4gPiBpbnRlcnJ1cHQtbmFtZXMv
Y2xvY2stbmFtZXMsIGJ1dCB0aGVuIEknbSBlYXNpbHkgY29uZnVzZWQhDQo+ID4NCj4gPiBOb25l
IG9mIHRoZSBleGlzdGluZyB1c2VycyBoYXZlIGFueSBpbnRlcnJ1cHQtbmFtZXMvY2xvY2stbmFt
ZXMNCj4gPiBoZW5jZSB0aGV5IGFyZSBub3QgaW4gcmVxdWlyZWQuIFRoZSByenYybSBpcyB0aGUg
b25seSBkZXZpY2UNCj4gPiB0aGF0IG5lZWRzIHRoZW0gc28gdGhlIGRyaXZlciBjYW4gZ2V0IHRo
ZW0gYnkgbmFtZSwgYW5kIGhlbmNlDQo+ID4gaXQgc2V0cyBtaW5JdGVtczogMg0KPiANCj4gVGhl
eSBhcmUgbm90IHJlcXVpcmVkIGJ1dCB0aGV5IGNhbiBhcHBlYXIuIE5vdGhpbmcgcHJldmVudHMg
aXQsIGJhc2VkIG9uDQo+IHlvdXIgcGF0Y2guDQoNCk9rLCBidXQgaW5zdGVhZCBvZiAnZWxzZTog
bmFycm93IHRoZSBudW1iZXIgb2YgaXRlbXMnLCBzaG91bGRuJ3QgSQ0Kc2V0IHRoZSBjbG9jay1u
YW1lcy9pbnRlcnJ1cHQtbmFtZXMgJ21pbkl0ZW1zOiAyJyBmb3Igcnp2Mm0gYXMgYWJvdmU/DQpU
aGlzIGlzIGJlY2F1c2UgdGhleSB3aWxsIG5vdyBkZWZhdWx0IHRvICdtaW5JdGVtczogMScgYWZ0
ZXIgeW91cg0KY29tbWVudD8NCg0KVGhhbmtzDQpQaGlsDQo=
