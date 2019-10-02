Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D4C23C8AE8
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 16:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728223AbfJBOTW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 10:19:22 -0400
Received: from mail-qk1-f194.google.com ([209.85.222.194]:43997 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfJBOTV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 10:19:21 -0400
Received: by mail-qk1-f194.google.com with SMTP id h126so15115871qke.10;
        Wed, 02 Oct 2019 07:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:cc:cc:to;
        bh=mta/aKAL9eEW7bBBX/DRzOEp1cQ9EgFs6mkHLvFlULo=;
        b=aORFjMupOzvwNAAubbXCrSdAoU06WB5LIp+MB5MnEmmtaaIufMgGQHAyPwUPe72QIb
         TMjJ/9PlSfW5IIf66p0j3vtzEbfzd+zqhRtkM1e9EzyZ4+FVSVIHtoSJduBIaMMM1hxX
         zQI6P2OYIlismiUDvcdGb1G0ebjaZwzR0Lg+Nk/AK0RQ7Au7Ox7ilWSy6x2UoOZJBM6P
         7+Jy8FGicOB3xE88VSE55Mdn5S+hlOrsWuh3Qr/Uv7wUveTLXo8ouVAm8owls+bS2j63
         50Xhf8ijpxj3j/TZY5slZAtxB7a1CLCvPeHDfw4h29yl1lpcSwTj5PLogfVSsFb7RLeu
         ICCQ==
X-Gm-Message-State: APjAAAX/4eznkpWn2QtnqC9LzzxzKjIr/MO/3+9AQpoW/9B1gxlSNmJf
        vpQPIPr3/TTFe7I5YVJuNA==
X-Google-Smtp-Source: APXvYqyexQE77VVzvCnxcFXbQrZoqvO9mLTtWdX/M/rdXqXO/pm7O3jy7suLmX7CzceeQ+l4jaNpcw==
X-Received: by 2002:a37:4cc7:: with SMTP id z190mr3932035qka.458.1570025960959;
        Wed, 02 Oct 2019 07:19:20 -0700 (PDT)
Received: from localhost ([132.205.230.8])
        by smtp.gmail.com with ESMTPSA id 207sm9947012qkh.33.2019.10.02.07.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2019 07:19:20 -0700 (PDT)
Message-ID: <5d94b1e8.1c69fb81.3df39.37d7@mx.google.com>
Date:   Wed, 02 Oct 2019 09:19:17 -0500
From:   Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT support
References: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
Cc:     Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
To:     Biju Das <biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 23 Sep 2019 15:28:27 +0100, Biju Das wrote:
> Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

