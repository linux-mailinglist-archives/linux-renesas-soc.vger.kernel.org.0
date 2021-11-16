Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 888D6452D87
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 10:06:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232728AbhKPJJX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 04:09:23 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:40306 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232790AbhKPJHp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 04:07:45 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 50887212B8;
        Tue, 16 Nov 2021 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637053487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PyNuqbCIhZHD9KCFTNj53MbLZCEyppxi3PHF7YiS0yc=;
        b=gSVOz+Zsh8FGqkjgTzETESaNXk8LnuMD0fHcfavQmo3TLv9n0s2J3c6hRh1ZB2u0lNRmF5
        ovBluGHdxnzEIGAt0/InJA5I7KCe4J2WfFpqvRyy3rUiN/og/1hGymkFLuPBnkgXjh5rvR
        5bhZfOOQRzVK8rxRDyVWzBqmbreVTh8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637053487;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PyNuqbCIhZHD9KCFTNj53MbLZCEyppxi3PHF7YiS0yc=;
        b=B8WX3T16MVEkP8ldmv9S4j+HzlPt5G9pwsnG6zyi1/7dgIwXMr6T1EzSBCxOdbFRSvD8Ic
        9PWniO7pogL3SlAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1783B13B37;
        Tue, 16 Nov 2021 09:04:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id FOqhBC90k2HmfQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 16 Nov 2021 09:04:47 +0000
Message-ID: <b00c8341-c1ca-df63-6fb4-c85f2ab92aa6@suse.de>
Date:   Tue, 16 Nov 2021 10:04:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 3/3] drm/cma-helper: Pass GEM CMA object in public
 interfaces
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com, emma@anholt.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-4-tzimmermann@suse.de>
 <YZJltbbFp4Gr201g@pendragon.ideasonboard.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YZJltbbFp4Gr201g@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zRMDIfCXGMn2ZjJHcBbZ8gys"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zRMDIfCXGMn2ZjJHcBbZ8gys
Content-Type: multipart/mixed; boundary="------------mvbBzDKK9ceR0PU1G44vH7OI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, kieran.bingham+renesas@ideasonboard.com,
 emma@anholt.net, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org
Message-ID: <b00c8341-c1ca-df63-6fb4-c85f2ab92aa6@suse.de>
Subject: Re: [PATCH 3/3] drm/cma-helper: Pass GEM CMA object in public
 interfaces
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-4-tzimmermann@suse.de>
 <YZJltbbFp4Gr201g@pendragon.ideasonboard.com>
In-Reply-To: <YZJltbbFp4Gr201g@pendragon.ideasonboard.com>

--------------mvbBzDKK9ceR0PU1G44vH7OI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTGF1cmVudA0KDQpBbSAxNS4xMS4yMSB1bSAxNDo1MCBzY2hyaWViIExhdXJlbnQgUGlu
Y2hhcnQ6DQo+IEhpIFRob21hcywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0K
PiANCj4gT24gTW9uLCBOb3YgMTUsIDIwMjEgYXQgMDE6MDE6NDhQTSArMDEwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBDaGFuZ2UgYWxsIEdFTSBDTUEgb2JqZWN0IGZ1bmN0
aW9ucyB0aGF0IHJlY2VpdmUgYSBHRU0gb2JqZWN0DQo+PiBvZiB0eXBlIHN0cnVjdCBkcm1f
Z2VtX29iamVjdCB0byBleHBlY3QgYW4gb2JqZWN0IG9mIHR5cGUNCj4+IHN0cnVjdCBkcm1f
Z2VtX2NtYV9vYmplY3QgaW5zdGVhZC4NCj4+DQo+PiBUaGlzIGNoYW5nZSByZWR1Y2VzIHRo
ZSBudW1iZXIgb2YgdXBjYXN0cyBmcm9tIHN0cnVjdCBkcm1fZ2VtX29iamVjdA0KPj4gYnkg
bW92aW5nIHRoZW0gaW50byBjYWxsZXJzLiBUaGUgQyBjb21waWxlciBjYW4gbm93IHZlcmlm
eSB0aGF0IHRoZQ0KPj4gR0VNIENNQSBmdW5jdGlvbnMgYXJlIGNhbGxlZCB3aXRoIHRoZSBj
b3JyZWN0IHR5cGUuDQo+Pg0KPj4gRm9yIGNvbnNpc3RlbmN5LCB0aGUgcGF0Y2ggYWxzbyBy
ZW5hbWVzIGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0IHRvDQo+PiBkcm1fZ2VtX2NtYV9mcmVl
LiBJdCBmdXJ0aGVyIHVwZGF0ZXMgZG9jdW1lbnRhdGlvbiBmb3IgYSBudW1iZXIgb2YNCj4+
IGZ1bmN0aW9ucy4NCj4gDQo+IEknbSBub3QgY29udmluY2VkIHRvIGJlIGhvbmVzdC4gSSB3
b24ndCBibG9jayB0aGlzIHNlcmllcywgYnV0IEkgZG9uJ3QNCj4gcmVhbGx5IHNlZSB3aGF0
IGl0IGJyaW5ncyB1cy4NCg0KVHlwZSBjaGVja2luZy4gSXQncyBtdWNoIGhhcmRlciB0byBh
Y2NpZGVudGFseSBwYXNzIGEgd3JvbmcgR0VNIG9iamVjdCANCihTSE1FTSwgVlJBTSwgZXRj
KSB0byB0aGUgZnVuY3Rpb25zIG5vdy4gSSBrbm93IHRoYXQgaXQncyBub3QgYmVlbiBhIA0K
c3VwZXItaHVnZSBwcm9ibGVtIHNvIGZhciwgYnV0IHN0aWxsIHdvcnRoIGFkZHJlc3Npbmcg
SU1ITy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IFNpZ25lZC1vZmYtYnk6
IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyB8IDUyICsrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfYm8uYyAg
ICAgICAgIHwgIDQgKy0tDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5o
ICAgICB8IDM5ICsrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4gICAzIGZpbGVzIGNoYW5nZWQs
IDQ4IGluc2VydGlvbnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4+IGluZGV4IDI3Y2NiNzFlM2Q2Ni4uN2Q0ODk1
ZGU5ZTBkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hl
bHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMN
Cj4+IEBAIC0zMiw2ICszMiwxMCBAQA0KPj4gICAgKiBUaGUgRFJNIEdFTS9DTUEgaGVscGVy
cyB1c2UgdGhpcyBhbGxvY2F0b3IgYXMgYSBtZWFucyB0byBwcm92aWRlIGJ1ZmZlcg0KPj4g
ICAgKiBvYmplY3RzIHRoYXQgYXJlIHBoeXNpY2FsbHkgY29udGlndW91cyBpbiBtZW1vcnku
IFRoaXMgaXMgdXNlZnVsIGZvcg0KPj4gICAgKiBkaXNwbGF5IGRyaXZlcnMgdGhhdCBhcmUg
dW5hYmxlIHRvIG1hcCBzY2F0dGVyZWQgYnVmZmVycyB2aWEgYW4gSU9NTVUuDQo+PiArICoN
Cj4+ICsgKiBGb3IgR0VNIGNhbGxiYWNrIGhlbHBlcnMgaW4gc3RydWN0ICZkcm1fZ2VtX29i
amVjdCBmdW5jdGlvbnMsIHNlZSBsaWtld2lzZQ0KPj4gKyAqIG5hbWVkIGZ1bmN0aW9ucyB3
aXRoIGFuIF9vYmplY3RfIGluZml4IChlLmcuLCBkcm1fZ2VtX2NtYV9vYmplY3Rfdm1hcCgp
IHdyYXBzDQo+PiArICogZHJtX2dlbV9jbWFfdm1hcCgpKS4gVGhlc2UgaGVscGVycyBwZXJm
b3JtIHRoZSBuZWNlc3NhcnkgdHlwZSBjb252ZXJzaW9uLg0KPj4gICAgKi8NCj4+ICAgDQo+
PiAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV9j
bWFfZGVmYXVsdF9mdW5jcyA9IHsNCj4+IEBAIC0xOTIsMTYgKzE5NiwxNiBAQCBkcm1fZ2Vt
X2NtYV9jcmVhdGVfd2l0aF9oYW5kbGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsDQo+
PiAgIH0NCj4+ICAgDQo+PiAgIC8qKg0KPj4gLSAqIGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0
IC0gZnJlZSByZXNvdXJjZXMgYXNzb2NpYXRlZCB3aXRoIGEgQ01BIEdFTSBvYmplY3QNCj4+
IC0gKiBAZ2VtX29iajogR0VNIG9iamVjdCB0byBmcmVlDQo+PiArICogZHJtX2dlbV9jbWFf
ZnJlZSAtIGZyZWUgcmVzb3VyY2VzIGFzc29jaWF0ZWQgd2l0aCBhIENNQSBHRU0gb2JqZWN0
DQo+PiArICogQGNtYV9vYmo6IENNQSBHRU0gb2JqZWN0IHRvIGZyZWUNCj4+ICAgICoNCj4+
ICAgICogVGhpcyBmdW5jdGlvbiBmcmVlcyB0aGUgYmFja2luZyBtZW1vcnkgb2YgdGhlIENN
QSBHRU0gb2JqZWN0LCBjbGVhbnMgdXAgdGhlDQo+PiAgICAqIEdFTSBvYmplY3Qgc3RhdGUg
YW5kIGZyZWVzIHRoZSBtZW1vcnkgdXNlZCB0byBzdG9yZSB0aGUgb2JqZWN0IGl0c2VsZi4N
Cj4+ICAgICogSWYgdGhlIGJ1ZmZlciBpcyBpbXBvcnRlZCBhbmQgdGhlIHZpcnR1YWwgYWRk
cmVzcyBpcyBzZXQsIGl0IGlzIHJlbGVhc2VkLg0KPj4gICAgKi8NCj4+IC12b2lkIGRybV9n
ZW1fY21hX2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaikNCj4+
ICt2b2lkIGRybV9nZW1fY21hX2ZyZWUoc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqY21h
X29iaikNCj4+ICAgew0KPj4gLQlzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2Jq
ID0gdG9fZHJtX2dlbV9jbWFfb2JqKGdlbV9vYmopOw0KPj4gKwlzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbV9vYmogPSAmY21hX29iai0+YmFzZTsNCj4+ICAgCXN0cnVjdCBkbWFfYnVm
X21hcCBtYXAgPSBETUFfQlVGX01BUF9JTklUX1ZBRERSKGNtYV9vYmotPnZhZGRyKTsNCj4+
ICAgDQo+PiAgIAlpZiAoZ2VtX29iai0+aW1wb3J0X2F0dGFjaCkgew0KPj4gQEAgLTIyMiw3
ICsyMjYsNyBAQCB2b2lkIGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqZ2VtX29iaikNCj4+ICAgDQo+PiAgIAlrZnJlZShjbWFfb2JqKTsNCj4+ICAg
fQ0KPj4gLUVYUE9SVF9TWU1CT0xfR1BMKGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0KTsNCj4+
ICtFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX2NtYV9mcmVlKTsNCj4+ICAgDQo+PiAgIC8q
Kg0KPj4gICAgKiBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0ZV9pbnRlcm5hbCAtIGNyZWF0ZSBh
IGR1bWIgYnVmZmVyIG9iamVjdA0KPj4gQEAgLTM2OSwxOCArMzczLDE1IEBAIEVYUE9SVF9T
WU1CT0xfR1BMKGRybV9nZW1fY21hX2dldF91bm1hcHBlZF9hcmVhKTsNCj4+ICAgDQo+PiAg
IC8qKg0KPj4gICAgKiBkcm1fZ2VtX2NtYV9wcmludF9pbmZvKCkgLSBQcmludCAmZHJtX2dl
bV9jbWFfb2JqZWN0IGluZm8gZm9yIGRlYnVnZnMNCj4+ICsgKiBAY21hX29iajogQ01BIEdF
TSBvYmplY3QNCj4+ICAgICogQHA6IERSTSBwcmludGVyDQo+PiAgICAqIEBpbmRlbnQ6IFRh
YiBpbmRlbnRhdGlvbiBsZXZlbA0KPj4gLSAqIEBvYmo6IEdFTSBvYmplY3QNCj4+ICAgICoN
Cj4+IC0gKiBUaGlzIGZ1bmN0aW9uIGNhbiBiZSB1c2VkIGFzIHRoZSAmZHJtX2RyaXZlci0+
Z2VtX3ByaW50X2luZm8gY2FsbGJhY2suDQo+PiAtICogSXQgcHJpbnRzIHBhZGRyIGFuZCB2
YWRkciBmb3IgdXNlIGluIGUuZy4gZGVidWdmcyBvdXRwdXQuDQo+PiArICogVGhpcyBmdW5j
dGlvbiBwcmludHMgcGFkZHIgYW5kIHZhZGRyIGZvciB1c2UgaW4gZS5nLiBkZWJ1Z2ZzIG91
dHB1dC4NCj4+ICAgICovDQo+PiAtdm9pZCBkcm1fZ2VtX2NtYV9wcmludF9pbmZvKHN0cnVj
dCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwNCj4+IC0JCQkgICAgY29u
c3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+PiArdm9pZCBkcm1fZ2VtX2NtYV9w
cmludF9pbmZvKGNvbnN0IHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmosDQo+
PiArCQkJICAgIHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCkN
Cj4+ICAgew0KPj4gLQljb25zdCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2Jq
ID0gdG9fZHJtX2dlbV9jbWFfb2JqKG9iaik7DQo+PiAtDQo+PiAgIAlkcm1fcHJpbnRmX2lu
ZGVudChwLCBpbmRlbnQsICJwYWRkcj0lcGFkXG4iLCAmY21hX29iai0+cGFkZHIpOw0KPj4g
ICAJZHJtX3ByaW50Zl9pbmRlbnQocCwgaW5kZW50LCAidmFkZHI9JXBcbiIsIGNtYV9vYmot
PnZhZGRyKTsNCj4+ICAgfQ0KPj4gQEAgLTM4OSw3ICszOTAsNyBAQCBFWFBPUlRfU1lNQk9M
KGRybV9nZW1fY21hX3ByaW50X2luZm8pOw0KPj4gICAvKioNCj4+ICAgICogZHJtX2dlbV9j
bWFfZ2V0X3NnX3RhYmxlIC0gcHJvdmlkZSBhIHNjYXR0ZXIvZ2F0aGVyIHRhYmxlIG9mIHBp
bm5lZA0KPj4gICAgKiAgICAgcGFnZXMgZm9yIGEgQ01BIEdFTSBvYmplY3QNCj4+IC0gKiBA
b2JqOiBHRU0gb2JqZWN0DQo+PiArICogQGNtYV9vYmo6IENNQSBHRU0gb2JqZWN0DQo+PiAg
ICAqDQo+PiAgICAqIFRoaXMgZnVuY3Rpb24gZXhwb3J0cyBhIHNjYXR0ZXIvZ2F0aGVyIHRh
YmxlIGJ5IGNhbGxpbmcgdGhlIHN0YW5kYXJkDQo+PiAgICAqIERNQSBtYXBwaW5nIEFQSS4N
Cj4+IEBAIC0zOTcsOSArMzk4LDkgQEAgRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2NtYV9wcmlu
dF9pbmZvKTsNCj4+ICAgICogUmV0dXJuczoNCj4+ICAgICogQSBwb2ludGVyIHRvIHRoZSBz
Y2F0dGVyL2dhdGhlciB0YWJsZSBvZiBwaW5uZWQgcGFnZXMgb3IgTlVMTCBvbiBmYWlsdXJl
Lg0KPj4gICAgKi8NCj4+IC1zdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fY21hX2dldF9zZ190
YWJsZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4+ICtzdHJ1Y3Qgc2dfdGFibGUg
KmRybV9nZW1fY21hX2dldF9zZ190YWJsZShzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpj
bWFfb2JqKQ0KPj4gICB7DQo+PiAtCXN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9v
YmogPSB0b19kcm1fZ2VtX2NtYV9vYmoob2JqKTsNCj4+ICsJc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmogPSAmY21hX29iai0+YmFzZTsNCj4+ICAgCXN0cnVjdCBzZ190YWJsZSAqc2d0
Ow0KPj4gICAJaW50IHJldDsNCj4+ICAgDQo+PiBAQCAtNDY1LDIyICs0NjYsMTkgQEAgRVhQ
T1JUX1NZTUJPTF9HUEwoZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlKTsNCj4+
ICAgLyoqDQo+PiAgICAqIGRybV9nZW1fY21hX3ZtYXAgLSBtYXAgYSBDTUEgR0VNIG9iamVj
dCBpbnRvIHRoZSBrZXJuZWwncyB2aXJ0dWFsDQo+PiAgICAqICAgICBhZGRyZXNzIHNwYWNl
DQo+PiAtICogQG9iajogR0VNIG9iamVjdA0KPj4gKyAqIEBjbWFfb2JqOiBDTUEgR0VNIG9i
amVjdA0KPj4gICAgKiBAbWFwOiBSZXR1cm5zIHRoZSBrZXJuZWwgdmlydHVhbCBhZGRyZXNz
IG9mIHRoZSBDTUEgR0VNIG9iamVjdCdzIGJhY2tpbmcNCj4+ICAgICogICAgICAgc3RvcmUu
DQo+PiAgICAqDQo+PiAtICogVGhpcyBmdW5jdGlvbiBtYXBzIGEgYnVmZmVyIGludG8gdGhl
IGtlcm5lbCdzDQo+PiAtICogdmlydHVhbCBhZGRyZXNzIHNwYWNlLiBTaW5jZSB0aGUgQ01B
IGJ1ZmZlcnMgYXJlIGFscmVhZHkgbWFwcGVkIGludG8gdGhlDQo+PiAtICoga2VybmVsIHZp
cnR1YWwgYWRkcmVzcyBzcGFjZSB0aGlzIHNpbXBseSByZXR1cm5zIHRoZSBjYWNoZWQgdmly
dHVhbA0KPj4gLSAqIGFkZHJlc3MuDQo+PiArICogVGhpcyBmdW5jdGlvbiBtYXBzIGEgYnVm
ZmVyIGludG8gdGhlIGtlcm5lbCdzIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4NCj4+ICsgKiBT
aW5jZSB0aGUgQ01BIGJ1ZmZlcnMgYXJlIGFscmVhZHkgbWFwcGVkIGludG8gdGhlIGtlcm5l
bCB2aXJ0dWFsIGFkZHJlc3MNCj4+ICsgKiBzcGFjZSB0aGlzIHNpbXBseSByZXR1cm5zIHRo
ZSBjYWNoZWQgdmlydHVhbCBhZGRyZXNzLg0KPj4gICAgKg0KPj4gICAgKiBSZXR1cm5zOg0K
Pj4gICAgKiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvdGhlcndp
c2UuDQo+PiAgICAqLw0KPj4gLWludCBkcm1fZ2VtX2NtYV92bWFwKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgKm1hcCkNCj4+ICtpbnQgZHJtX2dl
bV9jbWFfdm1hcChzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2JqLCBzdHJ1Y3Qg
ZG1hX2J1Zl9tYXAgKm1hcCkNCj4+ICAgew0KPj4gLQlzdHJ1Y3QgZHJtX2dlbV9jbWFfb2Jq
ZWN0ICpjbWFfb2JqID0gdG9fZHJtX2dlbV9jbWFfb2JqKG9iaik7DQo+PiAtDQo+PiAgIAlk
bWFfYnVmX21hcF9zZXRfdmFkZHIobWFwLCBjbWFfb2JqLT52YWRkcik7DQo+PiAgIA0KPj4g
ICAJcmV0dXJuIDA7DQo+PiBAQCAtNDg5LDcgKzQ4Nyw3IEBAIEVYUE9SVF9TWU1CT0xfR1BM
KGRybV9nZW1fY21hX3ZtYXApOw0KPj4gICANCj4+ICAgLyoqDQo+PiAgICAqIGRybV9nZW1f
Y21hX21tYXAgLSBtZW1vcnktbWFwIGFuIGV4cG9ydGVkIENNQSBHRU0gb2JqZWN0DQo+PiAt
ICogQG9iajogR0VNIG9iamVjdA0KPj4gKyAqIEBjbWFfb2JqOiBDTUEgR0VNIG9iamVjdA0K
Pj4gICAgKiBAdm1hOiBWTUEgZm9yIHRoZSBhcmVhIHRvIGJlIG1hcHBlZA0KPj4gICAgKg0K
Pj4gICAgKiBUaGlzIGZ1bmN0aW9uIG1hcHMgYSBidWZmZXIgaW50byBhIHVzZXJzcGFjZSBw
cm9jZXNzJ3MgYWRkcmVzcyBzcGFjZS4NCj4+IEBAIC00OTksOSArNDk3LDkgQEAgRVhQT1JU
X1NZTUJPTF9HUEwoZHJtX2dlbV9jbWFfdm1hcCk7DQo+PiAgICAqIFJldHVybnM6DQo+PiAg
ICAqIDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4N
Cj4+ICAgICovDQo+PiAtaW50IGRybV9nZW1fY21hX21tYXAoc3RydWN0IGRybV9nZW1fb2Jq
ZWN0ICpvYmosIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gK2ludCBkcm1fZ2Vt
X2NtYV9tbWFwKHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmosIHN0cnVjdCB2
bV9hcmVhX3N0cnVjdCAqdm1hKQ0KPj4gICB7DQo+PiAtCXN0cnVjdCBkcm1fZ2VtX2NtYV9v
YmplY3QgKmNtYV9vYmo7DQo+PiArCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gJmNt
YV9vYmotPmJhc2U7DQo+PiAgIAlpbnQgcmV0Ow0KPj4gICANCj4+ICAgCS8qDQo+PiBAQCAt
NTEyLDggKzUxMCw2IEBAIGludCBkcm1fZ2VtX2NtYV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkNCj4+ICAgCXZtYS0+dm1f
cGdvZmYgLT0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsNCj4+ICAgCXZt
YS0+dm1fZmxhZ3MgJj0gflZNX1BGTk1BUDsNCj4+ICAgDQo+PiAtCWNtYV9vYmogPSB0b19k
cm1fZ2VtX2NtYV9vYmoob2JqKTsNCj4+IC0NCj4+ICAgCWlmIChjbWFfb2JqLT5tYXBfbm9u
Y29oZXJlbnQpIHsNCj4+ICAgCQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHZtX2dldF9wYWdlX3By
b3Qodm1hLT52bV9mbGFncyk7DQo+PiAgIA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9iby5jDQo+PiBp
bmRleCA4MzA3NTZiMzE1OWUuLjZkMTI4MWEzNDNlOSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92YzQvdmM0X2JvLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQv
dmM0X2JvLmMNCj4+IEBAIC0xNzcsNyArMTc3LDcgQEAgc3RhdGljIHZvaWQgdmM0X2JvX2Rl
c3Ryb3koc3RydWN0IHZjNF9ibyAqYm8pDQo+PiAgIAkJYm8tPnZhbGlkYXRlZF9zaGFkZXIg
PSBOVUxMOw0KPj4gICAJfQ0KPj4gICANCj4+IC0JZHJtX2dlbV9jbWFfZnJlZV9vYmplY3Qo
b2JqKTsNCj4+ICsJZHJtX2dlbV9jbWFfZnJlZSgmYm8tPmJhc2UpOw0KPj4gICB9DQo+PiAg
IA0KPj4gICBzdGF0aWMgdm9pZCB2YzRfYm9fcmVtb3ZlX2Zyb21fY2FjaGUoc3RydWN0IHZj
NF9ibyAqYm8pDQo+PiBAQCAtNzIwLDcgKzcyMCw3IEBAIHN0YXRpYyBpbnQgdmM0X2dlbV9v
YmplY3RfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFf
c3RydWN0DQo+PiAgIAkJcmV0dXJuIC1FSU5WQUw7DQo+PiAgIAl9DQo+PiAgIA0KPj4gLQly
ZXR1cm4gZHJtX2dlbV9jbWFfbW1hcChvYmosIHZtYSk7DQo+PiArCXJldHVybiBkcm1fZ2Vt
X2NtYV9tbWFwKCZiby0+YmFzZSwgdm1hKTsNCj4+ICAgfQ0KPj4gICANCj4+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCB2YzRfdm1fb3BzID0gew0KPj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmgNCj4+IGluZGV4IDU2ZDJmOWZkZjlhYy4uYWRi
NTA3YTlkYmYwIDEwMDY0NA0KPj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV9jbWFfaGVs
cGVyLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5oDQo+PiBA
QCAtMzIsMjggKzMyLDIzIEBAIHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3Qgew0KPj4gICAj
ZGVmaW5lIHRvX2RybV9nZW1fY21hX29iaihnZW1fb2JqKSBcDQo+PiAgIAljb250YWluZXJf
b2YoZ2VtX29iaiwgc3RydWN0IGRybV9nZW1fY21hX29iamVjdCwgYmFzZSkNCj4+ICAgDQo+
PiAtLyogZnJlZSBHRU0gb2JqZWN0ICovDQo+PiAtdm9pZCBkcm1fZ2VtX2NtYV9mcmVlX29i
amVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmopOw0KPj4gLQ0KPj4gLS8qIGFs
bG9jYXRlIHBoeXNpY2FsIG1lbW9yeSAqLw0KPj4gICBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2Jq
ZWN0ICpkcm1fZ2VtX2NtYV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybSwNCj4+ICAg
CQkJCQkgICAgICBzaXplX3Qgc2l6ZSk7DQo+PiArdm9pZCBkcm1fZ2VtX2NtYV9mcmVlKHN0
cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmopOw0KPj4gK3ZvaWQgZHJtX2dlbV9j
bWFfcHJpbnRfaW5mbyhjb25zdCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2Jq
LA0KPj4gKwkJCSAgICBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHVuc2lnbmVkIGludCBpbmRl
bnQpOw0KPj4gK3N0cnVjdCBzZ190YWJsZSAqZHJtX2dlbV9jbWFfZ2V0X3NnX3RhYmxlKHN0
cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmopOw0KPj4gK2ludCBkcm1fZ2VtX2Nt
YV92bWFwKHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKmNtYV9vYmosIHN0cnVjdCBkbWFf
YnVmX21hcCAqbWFwKTsNCj4+ICtpbnQgZHJtX2dlbV9jbWFfbW1hcChzdHJ1Y3QgZHJtX2dl
bV9jbWFfb2JqZWN0ICpjbWFfb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+
PiAgIA0KPj4gICBleHRlcm4gY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNfc3RydWN0IGRy
bV9nZW1fY21hX3ZtX29wczsNCj4+ICAgDQo+PiAtdm9pZCBkcm1fZ2VtX2NtYV9wcmludF9p
bmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwNCj4+IC0J
CQkgICAgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KPj4gLQ0KPj4gLXN0
cnVjdCBzZ190YWJsZSAqZHJtX2dlbV9jbWFfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKTsNCj4+IC1pbnQgZHJtX2dlbV9jbWFfdm1hcChzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOw0KPj4gLWludCBkcm1f
Z2VtX2NtYV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSk7DQo+PiAtDQo+PiAgIC8qDQo+PiAgICAqIEdFTSBvYmplY3QgZnVu
Y3Rpb25zDQo+PiAgICAqLw0KPj4gICANCj4+ICAgLyoqDQo+PiAtICogZHJtX2dlbV9jbWFf
b2JqZWN0X2ZyZWUgLSBHRU0gb2JqZWN0IGZ1bmN0aW9uIGZvciBkcm1fZ2VtX2NtYV9mcmVl
X29iamVjdCgpDQo+PiArICogZHJtX2dlbV9jbWFfb2JqZWN0X2ZyZWUgLSBHRU0gb2JqZWN0
IGZ1bmN0aW9uIGZvciBkcm1fZ2VtX2NtYV9mcmVlKCkNCj4+ICAgICogQG9iajogR0VNIG9i
amVjdCB0byBmcmVlDQo+PiAgICAqDQo+PiAgICAqIFRoaXMgZnVuY3Rpb24gd3JhcHMgZHJt
X2dlbV9jbWFfZnJlZV9vYmplY3QoKS4gRHJpdmVycyB0aGF0IGVtcGxveSB0aGUgQ01BIGhl
bHBlcnMNCj4+IEBAIC02MSw3ICs1Niw5IEBAIGludCBkcm1fZ2VtX2NtYV9tbWFwKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+
PiAgICAqLw0KPj4gICBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2dlbV9jbWFfb2JqZWN0X2Zy
ZWUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopDQo+PiAgIHsNCj4+IC0JZHJtX2dlbV9j
bWFfZnJlZV9vYmplY3Qob2JqKTsNCj4+ICsJc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAq
Y21hX29iaiA9IHRvX2RybV9nZW1fY21hX29iaihvYmopOw0KPj4gKw0KPj4gKwlkcm1fZ2Vt
X2NtYV9mcmVlKGNtYV9vYmopOw0KPj4gICB9DQo+PiAgIA0KPj4gICAvKioNCj4+IEBAIC03
Niw3ICs3Myw5IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBkcm1fZ2VtX2NtYV9vYmplY3RfZnJl
ZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikNCj4+ICAgc3RhdGljIGlubGluZSB2b2lk
IGRybV9nZW1fY21hX29iamVjdF9wcmludF9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwg
dW5zaWduZWQgaW50IGluZGVudCwNCj4+ICAgCQkJCQkJIGNvbnN0IHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqKQ0KPj4gICB7DQo+PiAtCWRybV9nZW1fY21hX3ByaW50X2luZm8ocCwg
aW5kZW50LCBvYmopOw0KPj4gKwljb25zdCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpj
bWFfb2JqID0gdG9fZHJtX2dlbV9jbWFfb2JqKG9iaik7DQo+PiArDQo+PiArCWRybV9nZW1f
Y21hX3ByaW50X2luZm8oY21hX29iaiwgcCwgaW5kZW50KTsNCj4+ICAgfQ0KPj4gICANCj4+
ICAgLyoqDQo+PiBAQCAtOTEsNyArOTAsOSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZHJtX2dl
bV9jbWFfb2JqZWN0X3ByaW50X2luZm8oc3RydWN0IGRybV9wcmludGVyICpwLCB1bnNpZ25l
ZA0KPj4gICAgKi8NCj4+ICAgc3RhdGljIGlubGluZSBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9n
ZW1fY21hX29iamVjdF9nZXRfc2dfdGFibGUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
DQo+PiAgIHsNCj4+IC0JcmV0dXJuIGRybV9nZW1fY21hX2dldF9zZ190YWJsZShvYmopOw0K
Pj4gKwlzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0ICpjbWFfb2JqID0gdG9fZHJtX2dlbV9j
bWFfb2JqKG9iaik7DQo+PiArDQo+PiArCXJldHVybiBkcm1fZ2VtX2NtYV9nZXRfc2dfdGFi
bGUoY21hX29iaik7DQo+PiAgIH0NCj4+ICAgDQo+PiAgIC8qDQo+PiBAQCAtMTA3LDcgKzEw
OCw5IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHNnX3RhYmxlICpkcm1fZ2VtX2NtYV9vYmpl
Y3RfZ2V0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZ2VtX29iDQo+PiAgICAqLw0KPj4gICBzdGF0
aWMgaW5saW5lIGludCBkcm1fZ2VtX2NtYV9vYmplY3Rfdm1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgc3RydWN0IGRtYV9idWZfbWFwICptYXApDQo+PiAgIHsNCj4+IC0JcmV0
dXJuIGRybV9nZW1fY21hX3ZtYXAob2JqLCBtYXApOw0KPj4gKwlzdHJ1Y3QgZHJtX2dlbV9j
bWFfb2JqZWN0ICpjbWFfb2JqID0gdG9fZHJtX2dlbV9jbWFfb2JqKG9iaik7DQo+PiArDQo+
PiArCXJldHVybiBkcm1fZ2VtX2NtYV92bWFwKGNtYV9vYmosIG1hcCk7DQo+PiAgIH0NCj4+
ICAgDQo+PiAgIC8qKg0KPj4gQEAgLTEyMyw3ICsxMjYsOSBAQCBzdGF0aWMgaW5saW5lIGlu
dCBkcm1fZ2VtX2NtYV9vYmplY3Rfdm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwg
c3RydWN0IGRtYQ0KPj4gICAgKi8NCj4+ICAgc3RhdGljIGlubGluZSBpbnQgZHJtX2dlbV9j
bWFfb2JqZWN0X21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQ0KPj4gICB7DQo+PiAtCXJldHVybiBkcm1fZ2VtX2NtYV9tbWFw
KG9iaiwgdm1hKTsNCj4+ICsJc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqY21hX29iaiA9
IHRvX2RybV9nZW1fY21hX29iaihvYmopOw0KPj4gKw0KPj4gKwlyZXR1cm4gZHJtX2dlbV9j
bWFfbW1hcChjbWFfb2JqLCB2bWEpOw0KPj4gICB9DQo+PiAgIA0KPj4gICAvKg0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mvbBzDKK9ceR0PU1G44vH7OI--

--------------zRMDIfCXGMn2ZjJHcBbZ8gys
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGTdC4FAwAAAAAACgkQlh/E3EQov+AX
wg//Sm0hFenHO9aim8NtgHo4WMYlHpI9xaBK3yTsZxutMmuNhgim73oz/NLodiT5wZDd5wy2hbnJ
ln15szArGyLik1jjJqoZgBokbjd6qpCj1Zgsm6ezJGta0IC6aEtx1pr5pZcL9YHvSqwQfcy40Sbe
N4TmQ7lXxm5uNAtdNx3TjgukXzNsnvbmZ0GpaqFdS0mHa+MBl0YjZfXKe5P5O8Pymmm9YLg2/Dcy
dHCo3euDg7skuZncrYeiZz7/2bKnhfjJhP1Cuicm8b/vLESG1rEegAIVC2FByX2yrDijiIbWBPdc
aC+TWnLkxw8EaB0imBssR6vcpL/m9g/TWecnwr7pN0ItUB7jkSvAYd18TDTWoPluLrswwMTOfKEp
B7JWxbH8R8+tNcCnwgYxdLlt1nJRr1QNVoL6gXEUZsamt0FcZweHA/OJiufEm9I8x5vupyDww+bT
7LlQNJ0v0bt9AcNhW17RGhUlG981a771dqzFJlTWjBaeSgsuzkRmZjoZMMjoCvttrsGiZ8u/T1/i
gvJgzyxd0MBf+z5fBterV1aOazv+KcABHaPH0qOdxKh/YLqTys9UwnuQKcvklpG60rGnNHyyyUpY
yFV7JDx0yhZy2B6WjKKt4Yz3XUsuEi0IZMO/d/1S0GX90KpXbpvf0cb2rO17VrMPkpfp8kL6Rgsc
csc=
=b+t4
-----END PGP SIGNATURE-----

--------------zRMDIfCXGMn2ZjJHcBbZ8gys--
