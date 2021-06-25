Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 705BE3B4002
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 11:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230463AbhFYJIR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 05:08:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhFYJII (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 05:08:08 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DC1FC0613A2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Jun 2021 02:05:47 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id t8so3584567ybt.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 25 Jun 2021 02:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=benyossef-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9Ck+JECuHhF+XibLFt/1GgUC0k/E3vtnQI/RdAO/KzU=;
        b=0s46wxSkFGOIbh2ZSlXP4QzYuh3VOlHMQ0Zh5IQtJOp/+c7HSH4NK6s+r6q78liNfM
         TH98ALgxYuhrrGbkLr6Tb7QJD6Tu7WYrqBB3EnEHY2X5fJQ6UQ54Lk/AQiqNZvcFMpXv
         FZbLMkY33nfbSShMPFHwV1rWDAA3nFNBukwFvQTrvv89YkG2jD7gtBMu175tyJk0+i9s
         TX3SIZdD338CEP9wZ7GC+uuloeCZEANPN+E+AxVXj4Ne5qMsB+1XWvzNgKrQFGWfP6Nn
         H0XDFk+8B18ibahYyVFk8Yiyn0DYQplKBIzOIhgCfdEwimNy6Ao3jCBwhDRr3uF0gPeF
         GLMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9Ck+JECuHhF+XibLFt/1GgUC0k/E3vtnQI/RdAO/KzU=;
        b=XQqvXR1TO7hXQ5yIwnNrDXvIUWP3UUpORMPvc2CDj7fMYtOWbjs1dOV4ws79nO/glw
         bDxgb22sABm+98D7TsO4XxmFnmL9ea4RxiZ8J1HgJ3Mdq3UbgL3QeuhUjq0Kx9NBS5P9
         uZ2Dt2umcEr3a7CAjP5jEn7vc8HG4twewD4f/UbPZYXUDYBibtNot4c7P6xgt6rXb5Ju
         3jY9a1MmnjrKMrasSQf6olv+Da7q5ya6syxvLDEmxwdnQXsxYooFPkMSyCcZygmU1O0C
         qqkxUDncxc/WhQ3GVR+etepw8vOZQtvLxNhoC+Ma4vfOM0STEQO9duzTjYluux9LX54S
         3UoQ==
X-Gm-Message-State: AOAM531B5r3ohDfjCBSlDLsa2PnF2TWcbzGVuTS3vyHdqMW6ByclC/C1
        6vZ3SE8KrsBwx9vkg3JNBLQ8zoA2s+xr+HNkod7sJA==
X-Google-Smtp-Source: ABdhPJwT7mBTxFB2KCvGaabPBBhyDKh95AwbFKMcPsKCU7iReq/PJgisg+Lo2VGqUXkL6+aa9/rh5cwJxozsPm/VlP8=
X-Received: by 2002:a25:618a:: with SMTP id v132mr11371392ybb.129.1624611946586;
 Fri, 25 Jun 2021 02:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <ab361a862755e281f5fef67b3f678d66ae201781.1623413974.git.geert+renesas@glider.be>
 <20210624211348.GA1991366@robh.at.kernel.org>
In-Reply-To: <20210624211348.GA1991366@robh.at.kernel.org>
From:   Gilad Ben-Yossef <gilad@benyossef.com>
Date:   Fri, 25 Jun 2021 12:05:35 +0300
Message-ID: <CAOtvUMdhDhbvL8M8HkVi+4d1jXPpw4ORJTBooU0V8Q6JBqSO+g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: crypto: ccree: Convert to json-schema
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Fri, Jun 25, 2021 at 12:13 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, 11 Jun 2021 14:20:17 +0200, Geert Uytterhoeven wrote:
> > Convert the Arm TrustZone CryptoCell cryptographic engine Device Tree
> > binding documentation to json-schema.
> >
> > Document missing properties.
> > Update the example to match reality.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../bindings/crypto/arm,cryptocell.yaml       | 53 +++++++++++++++++++
> >  .../bindings/crypto/arm-cryptocell.txt        | 25 ---------
> >  2 files changed, 53 insertions(+), 25 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/crypto/arm,crypto=
cell.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/crypto/arm-crypto=
cell.txt
> >
>
> I'm applying this version which is dual licensed as that is the
> preference of my employeer, Arm, who is the copyright holder here. I'll
> sort this out internally with Gilad.

If it's fine with you, Rob, it's fine with me.

I'll sort out the procedure internally. Sorry for the previous noise.

For what it's worth:

Acked-by: Gilad Ben-Yossef <gilad@benyossef.com>

Gilad

--=20
Gilad Ben-Yossef
Chief Coffee Drinker

values of =CE=B2 will give rise to dom!
