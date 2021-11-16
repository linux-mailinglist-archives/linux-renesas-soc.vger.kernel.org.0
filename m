Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAAC452D6B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Nov 2021 10:00:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232635AbhKPJCx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 04:02:53 -0500
Received: from smtp-out1.suse.de ([195.135.220.28]:39954 "EHLO
        smtp-out1.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232486AbhKPJCx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 04:02:53 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 38294212BA;
        Tue, 16 Nov 2021 08:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1637053196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=peXc3CdwxJ9JZwOJGgsu2d/39R9KDIXaiMxW3GQCW+Y=;
        b=KFZUGcq3vpH3rhqBBLFv+umjZe26aKoxFGmNLJ5/b09JKQLgwZnyluyVgjQdyp0ACj4X1y
        GRqGYj98Vpuvb/Kv5xqbt3WL4Sy4E7RjJfkFOE+VBZ7VnN3bpw8nqJWzo2L10kj1d8EsXI
        rk6iY/fVmswkrJN4aSnM9qcQtbHc8+o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1637053196;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=peXc3CdwxJ9JZwOJGgsu2d/39R9KDIXaiMxW3GQCW+Y=;
        b=wp+l4m963m9QIVyJQ9tHbnkGRQR2+NziyRjKTwN36CKhwltFMPdMQf+UeKllFav+xqtrSs
        JaNtd52rKlf6sjCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E62613BF2;
        Tue, 16 Nov 2021 08:59:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id +kxfAgxzk2HrewAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 16 Nov 2021 08:59:56 +0000
Message-ID: <25711ad9-935b-86c5-3a9f-3963bef3d1d1@suse.de>
Date:   Tue, 16 Nov 2021 09:59:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/3] drm/cma-helper: Move driver and file ops to the end
 of header
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     emma@anholt.net, airlied@linux.ie,
        linux-renesas-soc@vger.kernel.org,
        kieran.bingham+renesas@ideasonboard.com,
        dri-devel@lists.freedesktop.org
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-2-tzimmermann@suse.de>
 <YZJjMwKpiedhcjyg@pendragon.ideasonboard.com>
From:   Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YZJjMwKpiedhcjyg@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HLLlAqKGpnD5TGnLdMMDVynV"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HLLlAqKGpnD5TGnLdMMDVynV
Content-Type: multipart/mixed; boundary="------------E3hY3Q1neSAyHDIcWMWa0JHi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: emma@anholt.net, airlied@linux.ie, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, dri-devel@lists.freedesktop.org
Message-ID: <25711ad9-935b-86c5-3a9f-3963bef3d1d1@suse.de>
Subject: Re: [PATCH 1/3] drm/cma-helper: Move driver and file ops to the end
 of header
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-2-tzimmermann@suse.de>
 <YZJjMwKpiedhcjyg@pendragon.ideasonboard.com>
In-Reply-To: <YZJjMwKpiedhcjyg@pendragon.ideasonboard.com>

--------------E3hY3Q1neSAyHDIcWMWa0JHi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgTGF1cmVudA0KDQpBbSAxNS4xMS4yMSB1bSAxNDo0MCBzY2hyaWViIExhdXJlbnQgUGlu
Y2hhcnQ6DQo+IEhpIFRob21hcywNCj4gDQo+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0K
PiANCj4gT24gTW9uLCBOb3YgMTUsIDIwMjEgYXQgMDE6MDE6NDZQTSArMDEwMCwgVGhvbWFz
IFppbW1lcm1hbm4gd3JvdGU6DQo+PiBSZXN0cnVjdHVyZSB0aGUgaGVhZGVyIGZpbGUgZm9y
IENNQSBoZWxwZXJzIGJ5IG1vdmluZyBkZWNsYXJhdGlvbnMNCj4+IGZvciBkcml2ZXIgYW5k
IGZpbGUgb3BlcmF0aW9ucyB0byB0aGUgZW5kIG9mIHRoZSBmaWxlLiBObyBmdW5jdGlvbmFs
DQo+PiBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPiANCj4gSSdtIG5vdCBzdXJlIHRvIHNlZSB3aGF0
IHdlIGdhaW4gZnJvbSB0aGlzLCBidXQgSSBkb24ndCBtaW5kLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNv
bT4NCg0KVGhhbmtzLiBUaGUgcGF0Y2ggb25seSBwcmVwYXJlcyB0aGUgZmlsZSBzdWNoIHRo
YXQgdGhlIHJlc3Qgb2YgdGhlIA0Kc2VyaWVzIGxvb2tzIGEgYml0IG5pY2VyLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gLS0tDQo+PiAgIGluY2x1ZGUvZHJtL2RybV9n
ZW1fY21hX2hlbHBlci5oIHwgMTE0ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0N
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDU0IGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIu
aCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5oDQo+PiBpbmRleCBjZDEzNTA4
YWNiYzEuLmUwZmI3YTBjZjAzZiAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9n
ZW1fY21hX2hlbHBlci5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX2NtYV9oZWxw
ZXIuaA0KPj4gQEAgLTMyLDc3ICszMiw0MCBAQCBzdHJ1Y3QgZHJtX2dlbV9jbWFfb2JqZWN0
IHsNCj4+ICAgI2RlZmluZSB0b19kcm1fZ2VtX2NtYV9vYmooZ2VtX29iaikgXA0KPj4gICAJ
Y29udGFpbmVyX29mKGdlbV9vYmosIHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QsIGJhc2Up
DQo+PiAgIA0KPj4gLSNpZm5kZWYgQ09ORklHX01NVQ0KPj4gLSNkZWZpbmUgRFJNX0dFTV9D
TUFfVU5NQVBQRURfQVJFQV9GT1BTIFwNCj4+IC0JLmdldF91bm1hcHBlZF9hcmVhCT0gZHJt
X2dlbV9jbWFfZ2V0X3VubWFwcGVkX2FyZWEsDQo+PiAtI2Vsc2UNCj4+IC0jZGVmaW5lIERS
TV9HRU1fQ01BX1VOTUFQUEVEX0FSRUFfRk9QUw0KPj4gLSNlbmRpZg0KPj4gLQ0KPj4gLS8q
Kg0KPj4gLSAqIERFRklORV9EUk1fR0VNX0NNQV9GT1BTKCkgLSBtYWNybyB0byBnZW5lcmF0
ZSBmaWxlIG9wZXJhdGlvbnMgZm9yIENNQSBkcml2ZXJzDQo+PiAtICogQG5hbWU6IG5hbWUg
Zm9yIHRoZSBnZW5lcmF0ZWQgc3RydWN0dXJlDQo+PiAtICoNCj4+IC0gKiBUaGlzIG1hY3Jv
IGF1dG9nZW5lcmF0ZXMgYSBzdWl0YWJsZSAmc3RydWN0IGZpbGVfb3BlcmF0aW9ucyBmb3Ig
Q01BIGJhc2VkDQo+PiAtICogZHJpdmVycywgd2hpY2ggY2FuIGJlIGFzc2lnbmVkIHRvICZk
cm1fZHJpdmVyLmZvcHMuIE5vdGUgdGhhdCB0aGlzIHN0cnVjdHVyZQ0KPj4gLSAqIGNhbm5v
dCBiZSBzaGFyZWQgYmV0d2VlbiBkcml2ZXJzLCBiZWNhdXNlIGl0IGNvbnRhaW5zIGEgcmVm
ZXJlbmNlIHRvIHRoZQ0KPj4gLSAqIGN1cnJlbnQgbW9kdWxlIHVzaW5nIFRISVNfTU9EVUxF
Lg0KPj4gLSAqDQo+PiAtICogTm90ZSB0aGF0IHRoZSBkZWNsYXJhdGlvbiBpcyBhbHJlYWR5
IG1hcmtlZCBhcyBzdGF0aWMgLSBpZiB5b3UgbmVlZCBhDQo+PiAtICogbm9uLXN0YXRpYyB2
ZXJzaW9uIG9mIHRoaXMgeW91J3JlIHByb2JhYmx5IGRvaW5nIGl0IHdyb25nIGFuZCB3aWxs
IGJyZWFrIHRoZQ0KPj4gLSAqIFRISVNfTU9EVUxFIHJlZmVyZW5jZSBieSBhY2NpZGVudC4N
Cj4+IC0gKi8NCj4+IC0jZGVmaW5lIERFRklORV9EUk1fR0VNX0NNQV9GT1BTKG5hbWUpIFwN
Cj4+IC0Jc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbmFtZSA9IHtcDQo+
PiAtCQkub3duZXIJCT0gVEhJU19NT0RVTEUsXA0KPj4gLQkJLm9wZW4JCT0gZHJtX29wZW4s
XA0KPj4gLQkJLnJlbGVhc2UJPSBkcm1fcmVsZWFzZSxcDQo+PiAtCQkudW5sb2NrZWRfaW9j
dGwJPSBkcm1faW9jdGwsXA0KPj4gLQkJLmNvbXBhdF9pb2N0bAk9IGRybV9jb21wYXRfaW9j
dGwsXA0KPj4gLQkJLnBvbGwJCT0gZHJtX3BvbGwsXA0KPj4gLQkJLnJlYWQJCT0gZHJtX3Jl
YWQsXA0KPj4gLQkJLmxsc2VlawkJPSBub29wX2xsc2VlayxcDQo+PiAtCQkubW1hcAkJPSBk
cm1fZ2VtX21tYXAsXA0KPj4gLQkJRFJNX0dFTV9DTUFfVU5NQVBQRURfQVJFQV9GT1BTIFwN
Cj4+IC0JfQ0KPj4gLQ0KPj4gICAvKiBmcmVlIEdFTSBvYmplY3QgKi8NCj4+ICAgdm9pZCBk
cm1fZ2VtX2NtYV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbV9vYmop
Ow0KPj4gICANCj4+IC0vKiBjcmVhdGUgbWVtb3J5IHJlZ2lvbiBmb3IgRFJNIGZyYW1lYnVm
ZmVyICovDQo+PiAtaW50IGRybV9nZW1fY21hX2R1bWJfY3JlYXRlX2ludGVybmFsKHN0cnVj
dCBkcm1fZmlsZSAqZmlsZV9wcml2LA0KPj4gLQkJCQkgICAgIHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sDQo+PiAtCQkJCSAgICAgc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdz
KTsNCj4+IC0NCj4+IC0vKiBjcmVhdGUgbWVtb3J5IHJlZ2lvbiBmb3IgRFJNIGZyYW1lYnVm
ZmVyICovDQo+PiAtaW50IGRybV9nZW1fY21hX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmls
ZSAqZmlsZV9wcml2LA0KPj4gLQkJCSAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLA0KPj4g
LQkJCSAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3MpOw0KPj4gLQ0KPj4g
ICAvKiBhbGxvY2F0ZSBwaHlzaWNhbCBtZW1vcnkgKi8NCj4+ICAgc3RydWN0IGRybV9nZW1f
Y21hX29iamVjdCAqZHJtX2dlbV9jbWFfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0s
DQo+PiAgIAkJCQkJICAgICAgc2l6ZV90IHNpemUpOw0KPj4gICANCj4+ICAgZXh0ZXJuIGNv
bnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCBkcm1fZ2VtX2NtYV92bV9vcHM7DQo+
PiAgIA0KPj4gLSNpZm5kZWYgQ09ORklHX01NVQ0KPj4gLXVuc2lnbmVkIGxvbmcgZHJtX2dl
bV9jbWFfZ2V0X3VubWFwcGVkX2FyZWEoc3RydWN0IGZpbGUgKmZpbHAsDQo+PiAtCQkJCQkg
ICAgdW5zaWduZWQgbG9uZyBhZGRyLA0KPj4gLQkJCQkJICAgIHVuc2lnbmVkIGxvbmcgbGVu
LA0KPj4gLQkJCQkJICAgIHVuc2lnbmVkIGxvbmcgcGdvZmYsDQo+PiAtCQkJCQkgICAgdW5z
aWduZWQgbG9uZyBmbGFncyk7DQo+PiAtI2VuZGlmDQo+PiAtDQo+PiAgIHZvaWQgZHJtX2dl
bV9jbWFfcHJpbnRfaW5mbyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHVuc2lnbmVkIGludCBp
bmRlbnQsDQo+PiAgIAkJCSAgICBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7
DQo+PiAgIA0KPj4gICBzdHJ1Y3Qgc2dfdGFibGUgKmRybV9nZW1fY21hX2dldF9zZ190YWJs
ZShzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7DQo+PiAraW50IGRybV9nZW1fY21hX3Zt
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFw
KTsNCj4+ICtpbnQgZHJtX2dlbV9jbWFfbW1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9i
aiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpOw0KPj4gKw0KPj4gKy8qDQo+PiArICog
RHJpdmVyIG9wcw0KPj4gKyAqLw0KPj4gKw0KPj4gKy8qIGNyZWF0ZSBtZW1vcnkgcmVnaW9u
IGZvciBEUk0gZnJhbWVidWZmZXIgKi8NCj4+ICtpbnQgZHJtX2dlbV9jbWFfZHVtYl9jcmVh
dGVfaW50ZXJuYWwoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsDQo+PiArCQkJCSAgICAg
c3RydWN0IGRybV9kZXZpY2UgKmRybSwNCj4+ICsJCQkJICAgICBzdHJ1Y3QgZHJtX21vZGVf
Y3JlYXRlX2R1bWIgKmFyZ3MpOw0KPj4gKw0KPj4gKy8qIGNyZWF0ZSBtZW1vcnkgcmVnaW9u
IGZvciBEUk0gZnJhbWVidWZmZXIgKi8NCj4+ICtpbnQgZHJtX2dlbV9jbWFfZHVtYl9jcmVh
dGUoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYsDQo+PiArCQkJICAgIHN0cnVjdCBkcm1f
ZGV2aWNlICpkcm0sDQo+PiArCQkJICAgIHN0cnVjdCBkcm1fbW9kZV9jcmVhdGVfZHVtYiAq
YXJncyk7DQo+PiArDQo+PiAgIHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqDQo+PiAgIGRybV9n
ZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0K
Pj4gICAJCQkJICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+PiAgIAkJ
CQkgIHN0cnVjdCBzZ190YWJsZSAqc2d0KTsNCj4+IC1pbnQgZHJtX2dlbV9jbWFfdm1hcChz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRtYV9idWZfbWFwICptYXApOw0K
Pj4gLWludCBkcm1fZ2VtX2NtYV9tbWFwKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSk7DQo+PiAgIA0KPj4gICAvKioNCj4+ICAgICog
RFJNX0dFTV9DTUFfRFJJVkVSX09QU19XSVRIX0RVTUJfQ1JFQVRFIC0gQ01BIEdFTSBkcml2
ZXIgb3BlcmF0aW9ucw0KPj4gQEAgLTE4NSw0ICsxNDgsNDcgQEAgZHJtX2dlbV9jbWFfcHJp
bWVfaW1wb3J0X3NnX3RhYmxlX3ZtYXAoc3RydWN0IGRybV9kZXZpY2UgKmRybSwNCj4+ICAg
CQkJCSAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsDQo+PiAgIAkJ
CQkgICAgICAgc3RydWN0IHNnX3RhYmxlICpzZ3QpOw0KPj4gICANCj4+ICsvKg0KPj4gKyAq
IEZpbGUgb3BzDQo+PiArICovDQo+PiArDQo+PiArI2lmbmRlZiBDT05GSUdfTU1VDQo+PiAr
dW5zaWduZWQgbG9uZyBkcm1fZ2VtX2NtYV9nZXRfdW5tYXBwZWRfYXJlYShzdHJ1Y3QgZmls
ZSAqZmlscCwNCj4+ICsJCQkJCSAgICB1bnNpZ25lZCBsb25nIGFkZHIsDQo+PiArCQkJCQkg
ICAgdW5zaWduZWQgbG9uZyBsZW4sDQo+PiArCQkJCQkgICAgdW5zaWduZWQgbG9uZyBwZ29m
ZiwNCj4+ICsJCQkJCSAgICB1bnNpZ25lZCBsb25nIGZsYWdzKTsNCj4+ICsjZGVmaW5lIERS
TV9HRU1fQ01BX1VOTUFQUEVEX0FSRUFfRk9QUyBcDQo+PiArCS5nZXRfdW5tYXBwZWRfYXJl
YQk9IGRybV9nZW1fY21hX2dldF91bm1hcHBlZF9hcmVhLA0KPj4gKyNlbHNlDQo+PiArI2Rl
ZmluZSBEUk1fR0VNX0NNQV9VTk1BUFBFRF9BUkVBX0ZPUFMNCj4+ICsjZW5kaWYNCj4+ICsN
Cj4+ICsvKioNCj4+ICsgKiBERUZJTkVfRFJNX0dFTV9DTUFfRk9QUygpIC0gbWFjcm8gdG8g
Z2VuZXJhdGUgZmlsZSBvcGVyYXRpb25zIGZvciBDTUEgZHJpdmVycw0KPj4gKyAqIEBuYW1l
OiBuYW1lIGZvciB0aGUgZ2VuZXJhdGVkIHN0cnVjdHVyZQ0KPj4gKyAqDQo+PiArICogVGhp
cyBtYWNybyBhdXRvZ2VuZXJhdGVzIGEgc3VpdGFibGUgJnN0cnVjdCBmaWxlX29wZXJhdGlv
bnMgZm9yIENNQSBiYXNlZA0KPj4gKyAqIGRyaXZlcnMsIHdoaWNoIGNhbiBiZSBhc3NpZ25l
ZCB0byAmZHJtX2RyaXZlci5mb3BzLiBOb3RlIHRoYXQgdGhpcyBzdHJ1Y3R1cmUNCj4+ICsg
KiBjYW5ub3QgYmUgc2hhcmVkIGJldHdlZW4gZHJpdmVycywgYmVjYXVzZSBpdCBjb250YWlu
cyBhIHJlZmVyZW5jZSB0byB0aGUNCj4+ICsgKiBjdXJyZW50IG1vZHVsZSB1c2luZyBUSElT
X01PRFVMRS4NCj4+ICsgKg0KPj4gKyAqIE5vdGUgdGhhdCB0aGUgZGVjbGFyYXRpb24gaXMg
YWxyZWFkeSBtYXJrZWQgYXMgc3RhdGljIC0gaWYgeW91IG5lZWQgYQ0KPj4gKyAqIG5vbi1z
dGF0aWMgdmVyc2lvbiBvZiB0aGlzIHlvdSdyZSBwcm9iYWJseSBkb2luZyBpdCB3cm9uZyBh
bmQgd2lsbCBicmVhayB0aGUNCj4+ICsgKiBUSElTX01PRFVMRSByZWZlcmVuY2UgYnkgYWNj
aWRlbnQuDQo+PiArICovDQo+PiArI2RlZmluZSBERUZJTkVfRFJNX0dFTV9DTUFfRk9QUyhu
YW1lKSBcDQo+PiArCXN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG5hbWUg
PSB7XA0KPj4gKwkJLm93bmVyCQk9IFRISVNfTU9EVUxFLFwNCj4+ICsJCS5vcGVuCQk9IGRy
bV9vcGVuLFwNCj4+ICsJCS5yZWxlYXNlCT0gZHJtX3JlbGVhc2UsXA0KPj4gKwkJLnVubG9j
a2VkX2lvY3RsCT0gZHJtX2lvY3RsLFwNCj4+ICsJCS5jb21wYXRfaW9jdGwJPSBkcm1fY29t
cGF0X2lvY3RsLFwNCj4+ICsJCS5wb2xsCQk9IGRybV9wb2xsLFwNCj4+ICsJCS5yZWFkCQk9
IGRybV9yZWFkLFwNCj4+ICsJCS5sbHNlZWsJCT0gbm9vcF9sbHNlZWssXA0KPj4gKwkJLm1t
YXAJCT0gZHJtX2dlbV9tbWFwLFwNCj4+ICsJCURSTV9HRU1fQ01BX1VOTUFQUEVEX0FSRUFf
Rk9QUyBcDQo+PiArCX0NCj4+ICsNCj4+ICAgI2VuZGlmIC8qIF9fRFJNX0dFTV9DTUFfSEVM
UEVSX0hfXyAqLw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------E3hY3Q1neSAyHDIcWMWa0JHi--

--------------HLLlAqKGpnD5TGnLdMMDVynV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGTcwsFAwAAAAAACgkQlh/E3EQov+B/
NQ/+OQIOQF98/dQ4oWL9kBUDasZ5yNzlkYPYAStL8nLsNp8Zcatcp/6bbOIYGTSwr68mb6pClPGH
ZQ+b2xO+yx91f3lGDSlmthUALWeKRnYlwuwqbQcKpdpe2bFqJKvmz8DI2mhopuzhgZRdnvfnPVpG
rftTw1xvKqKbV71k4ioduZHj//3RPIKia1aVAq0hORXuVmrCOAeKSW3kCUQs7WWjKZ/r1ls+SOqw
uqi4Swuw0zYW+BKJ90Tb+3tpFZQOdQ47thTgYfMIOB/DiXUyGApmDNLFJfykjC7MQ1uiNBxSNMLC
+nnVrJxtI7JPw5Ylz8C2o4N1G4iDNnpbMpgynYJosy9QRpQBnJerg/j1sNATcFTdzvLJqHX2XVAT
PvLh8Z+HNaqnmAemu5hyqZRac1PiuzwOONO0d/kOS6JbneAqZQ0otHsbtzJo80Fhn0I5u/YowXz1
PGDYydU+AuYv1l8g8vRhS+f48e28n/n/TatvOkfsSVPqOzvrOvuNwPKTyD2sGyFV3W8FTg+gnDmf
3jW0SCm4nr569X3lAX5qZMyT/CSstQ1fxM/+5ZXbPxnVGCLKOaiCOLAsJVBd0h6b3bXhI0fA1zFP
/8EMB0zqnOpToH92FVxeXMFieNPZwthW/MDOcjoneZyPnrKi40U0FfgLqyqXBkJ1HIw/E9WtB2Zr
xDI=
=5kxY
-----END PGP SIGNATURE-----

--------------HLLlAqKGpnD5TGnLdMMDVynV--
