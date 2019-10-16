Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E92ADA21E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Oct 2019 01:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406712AbfJPXZ7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 19:25:59 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41785 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726595AbfJPXZ7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 19:25:59 -0400
Received: by mail-pf1-f195.google.com with SMTP id q7so350016pfh.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Oct 2019 16:25:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:from:to:cc:subject:user-agent:date;
        bh=Qrvxi8VNIEP80MdoyXCLvX2dInmjYNYid6pa9CMx9/Y=;
        b=C1LD66Kn8oz6QcB4JFdprXZte3otJEvF9M2x3YmxrvIbQz6oHdj2oYpj6OogvYQljn
         rf6QL47fvOLb9HjbUEL+2zH59ECPYOgGXzagCFaZwp5GT1KcjTwrwM9pucVnjfhIlqBD
         ciUxzWRdllOfvxfpCZ3JK+oraf4kD0CEdfFdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:from:to:cc:subject
         :user-agent:date;
        bh=Qrvxi8VNIEP80MdoyXCLvX2dInmjYNYid6pa9CMx9/Y=;
        b=bE6hvfdxUBOkWN/WKuAxVqrICgJCAU7ezqJqnr3sRV1gNga9BKnajKvAQ2/ARMjwOV
         OqE2kHlbWtOHuXLoWSQFc9CzUQMqXjN7GORxhq8tCdgepTfFODP43FHWGmUUKE0wd74R
         Hx+f3fVwI2OJ7tpy8QN+R2kTtK1hUB8ltnsur08pfJnbrrMb1QPZ/3YOk0Zh1psEu4Bf
         hZQCCeLxuCWUh83VSYvrqvmLV0poMBo+8COPbPqol9IfgovkY8jsCBehdty2tp/XpELd
         ariIWdbgmH1j+5xdLGoA4eX7hXRyWuU9UtpyQqzdbKx1uRZ/9up2kqtB2oBTMTs4LNPA
         j51g==
X-Gm-Message-State: APjAAAWOmZpAJJB9kVo4REcr5sr0eHpbYVQ/e4strNbFkZNSHGNYTdPC
        b3nzZpiijTWRngiKD7D7QaF4jA==
X-Google-Smtp-Source: APXvYqzwan96igiVoJXoXnp0dlhIkgKisPOSNOslthiLl2WjZnd3MQpnyD29PbzVpemNzqdv3BAF4A==
X-Received: by 2002:a65:644c:: with SMTP id s12mr708041pgv.319.1571268358755;
        Wed, 16 Oct 2019 16:25:58 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id y6sm182241pfp.82.2019.10.16.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2019 16:25:58 -0700 (PDT)
Message-ID: <5da7a706.1c69fb81.7818.0cfe@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20191016143101.28738-1-geert+renesas@glider.be>
References: <20191016143101.28738-1-geert+renesas@glider.be>
From:   Stephen Boyd <swboyd@chromium.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Brown <broonie@kernel.org>
Cc:     linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] spi: rspi: Use platform_get_irq_byname_optional() for optional irqs
User-Agent: alot/0.8.1
Date:   Wed, 16 Oct 2019 16:25:57 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Geert Uytterhoeven (2019-10-16 07:31:01)
> As platform_get_irq_byname() now prints an error when the interrupt
> does not exist, scary warnings may be printed for optional interrupts:
>=20
>     renesas_spi e6b10000.spi: IRQ rx not found
>     renesas_spi e6b10000.spi: IRQ mux not found
>=20
> Fix this by calling platform_get_irq_byname_optional() instead.
> Remove the no longer needed printing of platform_get_irq errors, as the
> remaining calls to platform_get_irq() and platform_get_irq_byname() take
> care of that.
>=20
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to =
platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

