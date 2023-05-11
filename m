Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 51D776FEF16
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 May 2023 11:46:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjEKJq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 May 2023 05:46:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236419AbjEKJq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 May 2023 05:46:26 -0400
Received: from mail5.swissbit.com (mail5.swissbit.com [148.251.244.252])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05F355FCA;
        Thu, 11 May 2023 02:46:23 -0700 (PDT)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 1CFED3A2B4E;
        Thu, 11 May 2023 11:46:22 +0200 (CEST)
Received: from mail5.swissbit.com (localhost [127.0.0.1])
        by DDEI (Postfix) with ESMTP id 0DD033A1AD5;
        Thu, 11 May 2023 11:46:22 +0200 (CEST)
X-TM-AS-ERS: 10.181.10.102-127.5.254.253
X-TM-AS-SMTP: 1.0 bXgyLmRtei5zd2lzc2JpdC5jb20= Y2xvZWhsZUBoeXBlcnN0b25lLmNvb
        Q==
X-DDEI-TLS-USAGE: Used
Received: from mx2.dmz.swissbit.com (mx2.dmz.swissbit.com [10.181.10.102])
        by mail5.swissbit.com (Postfix) with ESMTPS;
        Thu, 11 May 2023 11:46:22 +0200 (CEST)
From:   Christian Loehle <CLoehle@hyperstone.com>
To:     Richard Weinberger <richard@nod.at>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        wsa+renesas <wsa+renesas@sang-engineering.com>,
        ulf hansson <ulf.hansson@linaro.org>
Subject: RE: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Topic: Poor write performance to boot area using rcar-gen3-sdhi
Thread-Index: jiFrfBZIr7HKS7MkHilHFl02Bun/Q/AMgGyAaB0PmjP8vxGocEw2ct+x/Z5ZwOAvOJ8Zmh6KUsXr/ZciBcB4n5SQpfxaAwsA
Date:   Thu, 11 May 2023 09:46:20 +0000
Message-ID: <94f03374781b4e978a39699815b21803@hyperstone.com>
References: <1674847756.113858.1681762124503.JavaMail.zimbra@nod.at>
 <971572458.117024.1681798584774.JavaMail.zimbra@nod.at>
 <02ceda502af34bf0af53d52598a0b71f@hyperstone.com>
 <522326845.127346.1681805484949.JavaMail.zimbra@nod.at>
 <f50de2461dae4931abf3f0216b836fd1@hyperstone.com>
 <1186364892.150923.1681819136247.JavaMail.zimbra@nod.at>
 <1273293952.226564.1682003880265.JavaMail.zimbra@nod.at>
 <398e244a4d3746f1bd7b4c32d1ea70e3@hyperstone.com>
 <615854031.8233438.1683631700226.JavaMail.zimbra@nod.at>
In-Reply-To: <615854031.8233438.1683631700226.JavaMail.zimbra@nod.at>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain;
        charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-TMASE-Version: DDEI-5.1-9.0.1002-27618.006
X-TMASE-Result: 10--5.037800-10.000000
X-TMASE-MatchedRID: QfHZjzml1E8EyPQwW5BBaqzGfgakLdjandls9F9zmi1v8+stHWaeos79
        PlJmAmXD1eKt+ktDRM8BW0uhJTasU8fyODhjv0Zebb4JyMK+kzBku5Wqt0zLZDqUJVT3gpbTxOv
        8bbijtGt7xbt8tJqsmR/6NlRf/ksHbMXHzk9qnQc8+i/lP6Xo8epxDIe48DMlH+aO+OES4dHFs9
        v0lf4kLjJIHCht2pOXu64EjJEAgAKrXOKso5Y21oh/ebSxR/HnTf5MrVmNIUCbKItl61J/yfmS+
        aPr0Ve8BieCUBZ0JhuNo+PRbWqfROJGF26G8SWypfzLa08EuFA6rDLTxc/Aq1EmQDaL8iFRE7eX
        wbiNPwzldlwuKTDyL0QyLxIbl0M9
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-TMASE-INERTIA: 0-0;;;;
X-TMASE-XGENCLOUD: 780f30a5-1143-4d45-9ca3-1eea84ae2487-0-0-200-0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBSaWNoYXJkIFdlaW5iZXJnZXIg
PHJpY2hhcmRAbm9kLmF0PiANClNlbnQ6IFR1ZXNkYXksIE1heSA5LCAyMDIzIDE6MjggUE0NClRv
OiBDaHJpc3RpYW4gTG9laGxlIDxDTG9laGxlQGh5cGVyc3RvbmUuY29tPg0KQ2M6IEJpanUgRGFz
IDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IGxpbnV4LW1tYyA8bGludXgtbW1jQHZnZXIu
a2VybmVsLm9yZz47IGxpbnV4LXJlbmVzYXMtc29jIDxsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtl
cm5lbC5vcmc+OyB3c2ErcmVuZXNhcyA8d3NhK3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+
OyB1bGYgaGFuc3NvbiA8dWxmLmhhbnNzb25AbGluYXJvLm9yZz4NClN1YmplY3Q6IFJlOiBQb29y
IHdyaXRlIHBlcmZvcm1hbmNlIHRvIGJvb3QgYXJlYSB1c2luZyByY2FyLWdlbjMtc2RoaQ0KDQoN
Cj4gU28gSSB3ZW50IGRvd24gdGhlIHJhYmJpdCBob2xlLg0KPiBBZnRlciBhbmFseXppbmcgdGhl
IG9wZXJhdGlvbiB0cmFjZXMgZnJvbSBMaW51eCBhbmQgdS1ib290IGluIG1vcmUgZGV0YWlsIEkg
aGFkIGFub3RoZXIgY2hhdCB3aXRoIHRoZSB2ZW5kb3IuIEl0IHR1cm5lZCBvdXQgdGhlaXIgYm9v
dCBhcmVhICppcyogZGlmZmVyZW50LCBpdCBvcGVyYXRlcyBvbiBhIG11Y2ggbGFyZ2VyIGludGVy
bmFsIGJsb2NrIHNpemUuDQo+IA0KPiBXaGlsZSB1LWJvb3QgZG9lcyBiYXNpY2FsbHkgYWxsIElP
IHdpdGggb25lIG9wIGNvZGUsIExpbnV4J3Mgd3JpdGViYWNrIHZpYSBwYWdlIGNhY2hlIHdyaXRl
cyA0ayB3aXNlIHdoaWNoIGxlYWRzIHRvIGNhdGFzdHJvcGhpYyBwZXJmb3JtYW5jZS4NCj4gVXNp
bmcgT19ESVJFQ1QgbWl0aWdhdGVzIHRoZSBpc3N1ZSwgdGhvdWdoLg0KDQpJbnRlcmVzdGluZywg
d2l0aG91dCBoYXZpbmcgdHJpZWQgaXQgb3V0IEkgd291bGQgZXhwZWN0IHRoZSA0ayB3cml0ZWJh
Y2tzIHRvIGJlIG1lcmdlZCB0byBhIGJpZ2dlciBJTywgdG9vPyBHaXZlbiB0aGF0IHRoZXkgYXJl
IGZpbGxlZCBzZXF1ZW50aWFsbHksIHdoaWNoIGlzIHRoZSBjYXNlLg0KQnV0IGdvb2QgdGhhdCB5
b3UgZ290IGl0IHdvcmtpbmcuIA0KSWYgSSBmaW5kIHRoZSB0aW1lIEkgd2lsbCBwbGF5IHdpdGgg
aXQgYSBiaXQuDQoNCj4gDQo+IFRoYW5rcyBldmVyeW9uZSBmb3IgeW91ciB2YWx1YWJsZSBpbnB1
dCENCj4gLy9yaWNoYXJkDQo+DQoNCkh5cGVyc3RvbmUgR21iSCB8IFJlaWNoZW5hdXN0ci4gMzlh
ICB8IDc4NDY3IEtvbnN0YW56Ck1hbmFnaW5nIERpcmVjdG9yOiBEci4gSmFuIFBldGVyIEJlcm5z
LgpDb21tZXJjaWFsIHJlZ2lzdGVyIG9mIGxvY2FsIGNvdXJ0czogRnJlaWJ1cmcgSFJCMzgxNzgy

