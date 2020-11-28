Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F193B2C757E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 28 Nov 2020 23:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388038AbgK1VtT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 28 Nov 2020 16:49:19 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:39734 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387547AbgK1TaS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 28 Nov 2020 14:30:18 -0500
Received: by mail-lj1-f196.google.com with SMTP id o24so10115232ljj.6;
        Sat, 28 Nov 2020 11:30:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jwkQXnv7ZyII/fGbCnZTZmAtdZL9K4+A6kNTmn7lIDc=;
        b=crHyVfgtUCnYKhp7VfFV9UHX1fvAspZgiwR4BPQaegDhs2FJ6VtKE4M8JfepJc/XW1
         lP+AzbgtoeVabPWxssFHPVoc3hMNr8m04koFYp1bcVbf/L3mA2sPXoG8RcQBlgXjJqTa
         scVCw2kGU3Yu6m8tpTLUgIA+7De9uoQC1yXLPNNz6HHbQpFnf1ZanvlIBdVOp3b7lyKX
         aQr+isHa9z1uJNJo1o3buXPtAGcxAnnxnwVh6kzLEgdgPg3ZFk4dnIDFRQqcFhAF6Vxw
         8ItBx2tlSDrlOXSJrymJ2VaOaO9nyIGlomDon+Aawq7S/rSp4UzUJPPBnqzm7023Mxx9
         aTsw==
X-Gm-Message-State: AOAM5338fnZaLrNvNXvNSXdRD8TBXlPiKmy+bxVrOXpfRmhwrc4uvcl7
        bVdHKFMr1zHS9d+2vJx5tHO6IMIB67g=
X-Google-Smtp-Source: ABdhPJyZz60kIEBhl7zZpRtZYCgDK0CEzNXaB5CG6FPXgHFASauifGdreGpG2MQPaJT6uMJ37PI/6A==
X-Received: by 2002:a17:906:4009:: with SMTP id v9mr12541669ejj.97.1606563708621;
        Sat, 28 Nov 2020 03:41:48 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id i7sm659288edr.61.2020.11.28.03.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2020 03:41:47 -0800 (PST)
Date:   Sat, 28 Nov 2020 12:41:45 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jiri Kosina <trivial@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        linux-renesas-soc@vger.kernel.org, Pavel Machek <pavel@denx.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2 5/5] memory: renesas-rpc-if: Export symbols as GPL
Message-ID: <20201128114145.GE4761@kozik-lap>
References: <20201126191146.8753-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201126191146.8753-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201126191146.8753-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 26, 2020 at 07:11:46PM +0000, Lad Prabhakar wrote:
> Renesas RPC-IF driver is licensed under GPL2.0, to be in sync export the
> symbols as GPL.

It's not a valid reason to export them as GPL. Entire Linux source code
is licensed as GPL-2.0, so are you going to change all EXPORT_SYMBOL to
GPL?

Please describe it better. Usually the symbols are exported as GPL if
they are considered tightly coupled with the kernel code. So tightly
that basically it is not a interface anymore but part of kernel
internals and therefore any usage of it is a derivative work of Linux
kernel. If this is the case here, please describe in commit msg why
these match this criteria.

Best regards,
Krzysztof
