Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94022368E77
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Apr 2021 10:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241188AbhDWIIl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Apr 2021 04:08:41 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:32356 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229456AbhDWIIl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Apr 2021 04:08:41 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 23 Apr 2021 16:07:51
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.224.61]
Date:   Fri, 23 Apr 2021 16:07:51 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc:     "Kangjie Lu" <kjlu@umn.edu>,
        "Geert Uytterhoeven" <geert+renesas@glider.be>,
        "Michael Turquette" <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>
Subject: Re: Re: [PATCH] [v3] clk: renesas: rcar-usb2-clock-sel: Fix error
 handling in rcar_usb2_clock_sel_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <CAMuHMdVgtZkO3FfLOph41cXXJbSuc16UX1Z+fD0_iNN7nM-GtA@mail.gmail.com>
References: <20210415073338.22287-1-dinghao.liu@zju.edu.cn>
 <CAMuHMdVgtZkO3FfLOph41cXXJbSuc16UX1Z+fD0_iNN7nM-GtA@mail.gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2fd8490f.73bcd.178fdc55590.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgC3nz5XgIJgP42CAQ--.54673W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgcEBlZdtTjJMQAAs5
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

PiBIaSBEaW5naGFvLAo+IAo+IE9uIFRodSwgQXByIDE1LCAyMDIxIGF0IDk6MzMgQU0gRGluZ2hh
byBMaXUgPGRpbmdoYW8ubGl1QHpqdS5lZHUuY24+IHdyb3RlOgo+ID4gVGhlIGVycm9yIGhhbmRs
aW5nIHBhdGhzIGFmdGVyIHBtX3J1bnRpbWVfZ2V0X3N5bmMoKSBoYXMgbm8KPiA+IHJlZmNvdW50
IGRlY3JlbWVudCwgd2hpY2ggbGVhZHMgdG8gcmVmY291bnQgbGVhay4KPiA+Cj4gPiBTaWduZWQt
b2ZmLWJ5OiBEaW5naGFvIExpdSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4K
PiA+IENoYW5nZWxvZzoKPiA+Cj4gPiB2MjogLSBNb3ZlIHRoZSBwb3NpdGlvbiBvZiBwbV9ydW50
aW1lX2VuYWJsZSxfZ2V0X3N5bmMoKS4KPiA+ICAgICAgIFVzZSBkZXZtX2Nsa19yZWdpc3Rlcigp
IHRvIHNpbXBsaWZ5IGVycm9yIGhhbmRsaW5nLgo+IAo+IFRoYW5rcyBmb3IgdGhlIHVwZGF0ZSEK
PiAKPiA+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcmNhci11c2IyLWNsb2NrLXNlbC5jCj4g
PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3JjYXItdXNiMi1jbG9jay1zZWwuYwo+ID4gQEAg
LTEzMSw3ICsxMzEsNiBAQCBzdGF0aWMgaW50IHJjYXJfdXNiMl9jbG9ja19zZWxfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgICAgICAgIHN0cnVjdCB1c2IyX2Nsb2Nr
X3NlbF9wcml2ICpwcml2ID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7Cj4gCj4gICAgIHdh
cm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhwcml24oCZIFstV3VudXNlZC12YXJpYWJsZV0KPiAK
PiBIYXZlIHlvdSBjb21waWxlZCB0aGlzPwo+IAoKVGhpcyBpcyBteSBjYXJlbGVzc25lc3MsIHRo
YW5rcyBmb3IgcG9pbnRpbmcgb3V0IHRoaXMuIFdoZW4gd2UgdXNlIApkZXZtX2Nsa19od19yZWdp
c3RlcigpLCB3ZSB3aWxsIG5vdCBuZWVkIHRvIHVucmVnaXN0ZXIgcHJpdi0+aHcgaW4gCnJjYXJf
dXNiMl9jbG9ja19zZWxfcmVtb3ZlKCkuIFNvIEkgdGhpbmsgaXQncyBva2F5IHRvIHJlbW92ZSAK
cGxhdGZvcm1fZ2V0X2RydmRhdGEoKSBpbiBpdCB0byBlbGltaW5hdGUgdGhpcyB3YXJuaW5nLgoK
RG8geW91IG5lZWQgYSBuZXcgdmVyc2lvbiBvZiBwYXRjaCB0byBmaXggdGhpcyB3YXJuaW5nPwoK
UmVnYXJkcywKRGluZ2hhbw==
