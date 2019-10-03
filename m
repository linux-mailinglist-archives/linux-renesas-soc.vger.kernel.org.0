Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B027CAC72
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 19:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387579AbfJCQKT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 12:10:19 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35219 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732921AbfJCQKS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 12:10:18 -0400
Received: by mail-pl1-f195.google.com with SMTP id c3so269348plo.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Oct 2019 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=v9Xix4ukYpxBHBe1n3DXedqcwTHB0Vaz/YT0zLakIIo=;
        b=EvjKgRekrDRXydliKainNvs1EDKpTaQC9hbAsmM3L4SgVhnCamPwwGeWgzLCmD/6ZN
         YJihKrj4Aua03JcGiXSnnv9gCPNFzimjX/dj6do1v8Tarr4QDToU5Y7qaBlDo7r0dOjB
         7MqZGdDBTEaz9H1tW70rmHCyl63UhJarLzgIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=v9Xix4ukYpxBHBe1n3DXedqcwTHB0Vaz/YT0zLakIIo=;
        b=r9dTNLLRwOpNWccEICoxj58mAIByx7PxRjQplKkf7ieGvMbS3IZlE+1uKPKLZ3S+tA
         3yy5ZoWlf5XUUtB8ztf+cus+tKz3R6WIv3dDmhFd96R/Cn7UKi6DWE8gaTGm7zy/NDWL
         JBvrbGoGgdpplIgCeKmpwtGfBxlrmVafUhsUZUQWaWxnO1qaBNwkq8Z9U/Z3djONb4t6
         pQ7rLEy5sBW3qCesbM7nbpgPdFcg5BPNbBTer/0JdQ7BR/WY82ZjDnfnViG/ry6XhMhy
         c/3a15IWCs+xzYvY/J3rpA4AjcUl9sPyIwT+5QGC5i4lpF12kti+XQ3Yz5lxdHNXLDen
         fTFA==
X-Gm-Message-State: APjAAAXR1a8zdHZorILx60WbsL+WKGL6zJD6ZZ/49zOEvw7TuzwBfq+a
        gQvLdoc+OAhFHyGQXHVUVOyKHQ==
X-Google-Smtp-Source: APXvYqwv9TynoMmQOqZjRuUUV4/ZHjd2t53y5sK2b6fAukPfOM6uRj4H5n6IfZmi7UusPIcmhIpQeQ==
X-Received: by 2002:a17:902:ba82:: with SMTP id k2mr9926433pls.293.1570119017817;
        Thu, 03 Oct 2019 09:10:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id b69sm3516011pfb.132.2019.10.03.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2019 09:10:17 -0700 (PDT)
Message-ID: <5d961d69.1c69fb81.43b1b.addf@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191001180743.1041-1-geert+renesas@glider.be>
References: <20191001180743.1041-1-geert+renesas@glider.be>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] serial: sh-sci: Use platform_get_irq_optional() for optional interrupts
User-Agent: alot/0.8.1
Date:   Thu, 03 Oct 2019 09:10:16 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-01 11:07:43)
> As platform_get_irq() now prints an error when the interrupt does not
> exist, scary warnings may be printed for optional interrupts:
>=20
>     sh-sci e6550000.serial: IRQ index 1 not found
>     sh-sci e6550000.serial: IRQ index 2 not found
>     sh-sci e6550000.serial: IRQ index 3 not found
>     sh-sci e6550000.serial: IRQ index 4 not found
>     sh-sci e6550000.serial: IRQ index 5 not found
>=20
> Fix this by calling platform_get_irq_optional() instead for all but the
> first interrupts, which are optional.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

