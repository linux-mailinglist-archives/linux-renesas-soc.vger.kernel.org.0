Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3A1DCA2F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 18:14:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732525AbfJCQKs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 12:10:48 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:37374 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730540AbfJCQKs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 12:10:48 -0400
Received: by mail-pl1-f195.google.com with SMTP id u20so1741274plq.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 09:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=/uux4QaLIxBgIS+S90+1Po/wEnZf/E4w+wy45KhyTSY=;
        b=UrI0SMgaaYbIISJ6/D8xRZ4Lk/gZoGdz0emX9xVpLMpkthMjLeCbmaU65NX8oYdJvd
         np8cgUQj2oR4WuMDHF9iJzr5P5yiG+GzNApMl/DPqi6kdXqj34g/c9KTEnb8EmdO5wc5
         22dxnYWmPxhzWdfW5bWKUKI2yJBgdCBKc1jU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=/uux4QaLIxBgIS+S90+1Po/wEnZf/E4w+wy45KhyTSY=;
        b=Pr1uXCOmChXQP6wkGOaL5b5Ql4ytiSXQxWZy4LUKuU7LUsS2/YYvJpNDeITQmsY5VV
         N+Muxv+lFsjAU/ymFZ/s8zBkLiaoklLW5psOnWTzPDjb/y8cuoJS976P/Hk93tT/qlek
         ih8F7z4IDwq7Kc/hkQRgkPM3EtW5Fu9kdwKB98fNwiLehq1T7/hs7ji+L3nd3+tLmZdM
         bszRq734yy7KmUJXNk5mNxFkoYfTLdyhwwhZUeNTk63gYfiE0Gp1W1jxjnvcGLcHCURo
         qzIRt45COe8NSFuqW5V1dILwPQB3ErWLnDeTyoQaVYjONIO/0Whj30HQ8KmubeBDKqXO
         HrDA==
X-Gm-Message-State: APjAAAWQlaVQQeVm9s1hgOnR9yYVIA9Y6tHsjl/LgH0Cm8cMa3uFaLP5
        X3XIaa7ZE4YHMukgveNfxcQnIQ==
X-Google-Smtp-Source: APXvYqwZH1M6/LhbGuuzz592WQ9OjilbEDeLMqV+Nwj//lGPPbOMeQP4nSTTUjncGz1/gK/4ggJ8eQ==
X-Received: by 2002:a17:902:ff18:: with SMTP id f24mr10300646plj.173.1570119047382;
        Thu, 03 Oct 2019 09:10:47 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id z13sm3540938pfg.172.2019.10.03.09.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:10:45 -0700 (PDT)
Message-ID: <5d961d85.1c69fb81.b9642.b721@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001181109.1355-1-geert+renesas@glider.be>
References: <20191001181109.1355-1-geert+renesas@glider.be>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Use platform_get_irq_optional() for optional irq
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 09:10:44 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-01 11:11:09)
> As platform_get_irq() now prints an error when the interrupt does not
> exist, a scary warning may be printed for an optional interrupt:
>=20
>     phy_rcar_gen3_usb2 ee0a0200.usb-phy: IRQ index 0 not found
>=20
> Fix this by calling platform_get_irq_optional() instead.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

