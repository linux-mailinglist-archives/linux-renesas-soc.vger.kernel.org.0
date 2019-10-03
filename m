Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC51C99E6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 10:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727943AbfJCI3w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 04:29:52 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:40550 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727259AbfJCI3w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 04:29:52 -0400
Received: by mail-oi1-f196.google.com with SMTP id k9so1814385oib.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 01:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VBvqwmaIJ8fEwaxA8s+S3oVp3rkPvTX+z8hSKj1PS4c=;
        b=0oNefL6B3FVIYs1SWGq/ggLp5+uLm/aPRIW59dbBP+8+SNxf0I9cwPjuUD2b3j/rLd
         4kWl9M/vx9AhKhNJ/2psET9bk7C9WOZ+Y19XLdDAGm8uk8WaXRB899WaEPeKwLCVsrHl
         InuR0WFRekVFVYnx0/2XErsoorX0EvAGkY1ZCAr6WYdglIXUZats0N8OlZQy7LY89jkU
         71LkKbqZ5QP4zeGmG1jvbhW4rc8d9dAjsBThdljtUAIw/stfzZgkIsO41MHEpyHI83e3
         +3uTDPH0bMZiAulBDD5KRSH9bR0IuAbu0N80u8VqWmkU1Lv8TrcRCQ9ZnQeb3v+DlViV
         PR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VBvqwmaIJ8fEwaxA8s+S3oVp3rkPvTX+z8hSKj1PS4c=;
        b=Ti4R4aCuKTz3znylivlI1aZCgT8To1NZ6K89gXfU91wAFB/4wdUfVA3X9PHbIiiLBV
         qwNw4nrZRvlImuZzPPGmV2Jf3CjlO8f1B2foDYPG9HN7hC7ehz1Wks9Mb6/u8bH0RLXc
         ljgMHc8FXb8grJSV9g4hnpdoD8giqW/bQqyglp3CVP4e7iUh5NNdWxe3SXGpJYAMyz8p
         vnMBdN6KtsqZGcEWanUja77qqUgQJhbOuh93Sq0XAMWESPM+JfmtY3bkWpsLmnvg/eIU
         MT9p0P6ON1G6tIUnyd1jGkeBm7uo1T1Vs6+ow2T3odHcgEQJgdep/FpxtReborjNl+OF
         ZzQA==
X-Gm-Message-State: APjAAAXZGkkQ8FNFP8sVChkvIBCBlFV41m/kUdoopKGQDN2PGRkPw6RW
        dTBI0oj4pzmG6a8/L0cvriVMUyCNqUjn2kxuWlyeXEGx
X-Google-Smtp-Source: APXvYqwQjgl+zQPvXkvV61OuT3KyDHZ69iup+K/HVAZKO4++KAu2JrTfJ0zCjUNUNkiEOOnCO51LwdKqH+XcBvr/A7w=
X-Received: by 2002:aca:4e85:: with SMTP id c127mr1881594oib.21.1570091389892;
 Thu, 03 Oct 2019 01:29:49 -0700 (PDT)
MIME-Version: 1.0
References: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569245268-61920-1-git-send-email-biju.das@bp.renesas.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 3 Oct 2019 10:29:38 +0200
Message-ID: <CAMpxmJUtv61rSLprBQJr0X5B0MNM=B6WYu0qu6WjeLA9-qxFkw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: gpio: rcar: Add DT binding for r8a774b1
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

pon., 23 wrz 2019 o 15:28 Biju Das <biju.das@bp.renesas.com> napisa=C5=82(a=
):
>
> Document Renesas' RZ/G2N (R8A774B1) GPIO blocks compatibility within the
> relevant dt-bindings.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt=
 b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> index f3f2c46..41e5fed 100644
> --- a/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> +++ b/Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> @@ -8,6 +8,7 @@ Required Properties:
>      - "renesas,gpio-r8a7745": for R8A7745 (RZ/G1E) compatible GPIO contr=
oller.
>      - "renesas,gpio-r8a77470": for R8A77470 (RZ/G1C) compatible GPIO con=
troller.
>      - "renesas,gpio-r8a774a1": for R8A774A1 (RZ/G2M) compatible GPIO con=
troller.
> +    - "renesas,gpio-r8a774b1": for R8A774B1 (RZ/G2N) compatible GPIO con=
troller.
>      - "renesas,gpio-r8a774c0": for R8A774C0 (RZ/G2E) compatible GPIO con=
troller.
>      - "renesas,gpio-r8a7778": for R8A7778 (R-Car M1) compatible GPIO con=
troller.
>      - "renesas,gpio-r8a7779": for R8A7779 (R-Car H1) compatible GPIO con=
troller.
> --
> 2.7.4
>

Patch applied, thanks!

Bart
