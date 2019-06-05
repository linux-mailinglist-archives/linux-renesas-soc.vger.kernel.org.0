Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ADFC35D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 15:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727957AbfFENIZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 09:08:25 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44539 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727601AbfFENIY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 09:08:24 -0400
Received: by mail-lj1-f195.google.com with SMTP id k18so1338776ljc.11;
        Wed, 05 Jun 2019 06:08:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yz9OuL+nLEMu3OpVhLYOUZixMuQM2Gz1jkl0HwzACWc=;
        b=M9/2g71pWTCuGuO91O3KBaZXKeMFozaH+pL3v52JU7CZl/CyC67SgvFwj8xX/SWJZe
         F63FI8EV3UBAyy152hEXZwjMglIG9BpxmaZYX0SwgzKfhtCE8U/+DaUA3DFqUlDvmBPD
         cxelXlDFcO04WcmceEtwE12hvuW7UmBA0t1rzFkY8BNFUq2W3S2kgJrG9q0tEtnv2kmP
         1lxYrqtwz54QLILRrzt1lnempNlwYvsJ6JKLjAXdV8wAHfCZtrcwvz4NnQdd49cZZ7jb
         yzU+OwKf6YOFvkx2nKvaIwzKsM1SUjxFLZyFmUv1JBfIXSvQglJdRE8DD9U2CDUI6Qzx
         xdKQ==
X-Gm-Message-State: APjAAAWS2RxpI6KkKgbTuYKPOFznzZCnLiVauisMCiWd9GIBl7lilqEK
        3XLyqd9IeKn5Su3+m1VFX9EB7Y/CwwDeQVRB91d/NQ==
X-Google-Smtp-Source: APXvYqyHzb7fPX9GJKdP7LOu6W54B5uLKXCFgoqcuAX2lZKLhMTm7841KLlt2nzYN5ukIGykWmmzlWhtO8xEHwRCOdI=
X-Received: by 2002:a2e:7f15:: with SMTP id a21mr3214097ljd.51.1559740102651;
 Wed, 05 Jun 2019 06:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <1559710142-29161-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUqajM2yR72AYE5ppp-RJumfoG2+YArEzLiJvt55_1k4g@mail.gmail.com> <OSAPR01MB30897161EF40942B1E561232D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
In-Reply-To: <OSAPR01MB30897161EF40942B1E561232D8160@OSAPR01MB3089.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 5 Jun 2019 15:08:10 +0200
Message-ID: <CAMuHMdVHpOULpusZeOJvRs8OMoC2JopOqrK9Q8KeCxtyEbz0qA@mail.gmail.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: fix imbalance powered flag
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000c2cf90058a934a75"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--000000000000c2cf90058a934a75
Content-Type: text/plain; charset="UTF-8"

Hi Shimoda-san,

On Wed, Jun 5, 2019 at 2:12 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Wednesday, June 5, 2019 6:25 PM
> <snip>
> > Thank you, this seems to fix the warning, so
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Thank you for the testing!
>
> > However, the other imbalance (phy-ee080200.usb-phy.6 enabling its
> > regulator during each system resume phase, but never touching it
> > otherwise) is still present.
>
> Umm, since I'd like to investigate this,
> would you share your debug print patch?

Attached.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

--000000000000c2cf90058a934a75
Content-Type: text/x-patch; charset="US-ASCII"; name="phy-rcar-gen3-usb2-debug.patch"
Content-Disposition: attachment; filename="phy-rcar-gen3-usb2-debug.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jwj8z49l0>
X-Attachment-Id: f_jwj8z49l0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGh5L3JlbmVzYXMvcGh5LXJjYXItZ2VuMy11c2IyLmMgYi9k
cml2ZXJzL3BoeS9yZW5lc2FzL3BoeS1yY2FyLWdlbjMtdXNiMi5jCmluZGV4IGRkMmQ3MjkwY2Zh
ZGUyOGQuLjFkN2QyOGNmMGE3NzMwZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGh5L3JlbmVzYXMv
cGh5LXJjYXItZ2VuMy11c2IyLmMKKysrIGIvZHJpdmVycy9waHkvcmVuZXNhcy9waHktcmNhci1n
ZW4zLXVzYjIuYwpAQCAtNDQzLDEwICs0NDMsMTMgQEAgc3RhdGljIGludCByY2FyX2dlbjNfcGh5
X3VzYjJfcG93ZXJfb24oc3RydWN0IHBoeSAqcCkKIAkJZ290byBvdXQ7CiAKIAlpZiAoY2hhbm5l
bC0+dmJ1cykgeworZGV2X2luZm8oJnAtPmRldiwgIiVzOiBFbmFibGluZyByZWd1bGF0b3JcbiIs
IF9fZnVuY19fKTsKIAkJcmV0ID0gcmVndWxhdG9yX2VuYWJsZShjaGFubmVsLT52YnVzKTsKK2Rl
dl9pbmZvKCZwLT5kZXYsICIlczogcmVndWxhdG9yX2VuYWJsZSgpIHJldHVybmVkICVkXG4iLCBf
X2Z1bmNfXywgcmV0KTsKIAkJaWYgKHJldCkKIAkJCWdvdG8gb3V0OwogCX0KK2Vsc2UgZGV2X2lu
Zm8oJnAtPmRldiwgIiVzOiBOb3QgZW5hYmxpbmcgcmVndWxhdG9yXG4iLCBfX2Z1bmNfXyk7CiAK
IAl2YWwgPSByZWFkbCh1c2IyX2Jhc2UgKyBVU0IyX1VTQkNUUik7CiAJdmFsIHw9IFVTQjJfVVNC
Q1RSX1BMTF9SU1Q7CkBAIC00NzMsNyArNDc2LDEyIEBAIHN0YXRpYyBpbnQgcmNhcl9nZW4zX3Bo
eV91c2IyX3Bvd2VyX29mZihzdHJ1Y3QgcGh5ICpwKQogCQlyZXR1cm4gMDsKIAogCWlmIChjaGFu
bmVsLT52YnVzKQoreworZGV2X2luZm8oJnAtPmRldiwgIiVzOiBEaXNhYmxpbmcgcmVndWxhdG9y
XG4iLCBfX2Z1bmNfXyk7CiAJCXJldCA9IHJlZ3VsYXRvcl9kaXNhYmxlKGNoYW5uZWwtPnZidXMp
OworZGV2X2luZm8oJnAtPmRldiwgIiVzOiByZWd1bGF0b3JfZGlzYWJsZSgpIHJldHVybmVkICVk
XG4iLCBfX2Z1bmNfXywgcmV0KTsKK30KK2Vsc2UgZGV2X2luZm8oJnAtPmRldiwgIiVzOiBOb3Qg
ZGlzYWJsaW5nIHJlZ3VsYXRvclxuIiwgX19mdW5jX18pOwogCiAJcmV0dXJuIHJldDsKIH0K
--000000000000c2cf90058a934a75--
