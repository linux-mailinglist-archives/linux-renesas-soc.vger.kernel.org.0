Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DEF2FD1278
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Oct 2019 17:27:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731392AbfJIP1g (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Oct 2019 11:27:36 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:33673 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731375AbfJIP1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 11:27:35 -0400
Received: by mail-ot1-f67.google.com with SMTP id 60so2082910otu.0;
        Wed, 09 Oct 2019 08:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=07anXH9cvkkFqpNI/4PYzzEY8tSMrjDGE6s78JlBZiQ=;
        b=F0WyIg+7IUGhqunFvgCSu/8IUzlhLp+JuLg2b7Ak9ubtAcUp4M8RhDZpU0IyDq1V9C
         oDF7hB5Qjs03NKN5WWzCb02utkfkzTPq4zxf7bMa5tec6YRiwu+dIiD5OvcywRYntEWX
         QNB4qnspG7Vnh9pyEGyTeu1/rY0UBfjKPYqf69BwW1OOsT/7ZWzaCwnbowKzn9V8e1Wz
         lp8ZlaEN6RpDptYjiTIMq95LvGEuwdLMvOSKfFNTYbP4XVzDBIeKEE//StJnmEYx61q3
         gLEH/VQ1uKAsZxitw7AFc0exebxhLVvr+GqpxIqT/QZavRXE8WLY9TlmPNSBFn0d7dT1
         /Elw==
X-Gm-Message-State: APjAAAVsCZBi29MfmsHLVCWMb7LxiZlKrLCGE+wQZJyvqmoqnY05fV2O
        xEFBx1NqXZjkHPNXcoTpg/nBqK1pCX01/IJvaodDq7Vc
X-Google-Smtp-Source: APXvYqxqd/nFpJlshpLb6J12+2UwudlTeP5E2v6m7qvRfJN8iMWcBqLv5hgtpQHr55VK5ecVh2cdiQJoeYrvb+j+w8M=
X-Received: by 2002:a05:6830:1b75:: with SMTP id d21mr3468821ote.145.1570634854972;
 Wed, 09 Oct 2019 08:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <1570029619-43238-1-git-send-email-biju.das@bp.renesas.com> <1570029619-43238-8-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1570029619-43238-8-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 9 Oct 2019 17:27:24 +0200
Message-ID: <CAMuHMdWU9pkELFnGD7QuowZMy2hfpXkcVScresXUpt9y1SKe_w@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] arm64: dts: renesas: hihope-rzg2-ex: Enable backlight
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Oct 2, 2019 at 5:21 PM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch enables backlight support.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
