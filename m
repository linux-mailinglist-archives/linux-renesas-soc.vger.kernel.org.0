Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71F4E62E2A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jul 2019 04:34:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbfGICeH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 22:34:07 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:43213 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbfGICeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 22:34:07 -0400
Received: by mail-io1-f66.google.com with SMTP id k20so39820722ios.10;
        Mon, 08 Jul 2019 19:34:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Jmvcnf17SdTOjp+JcKTP5mZou8gtz+qNNgynsKTEhKQ=;
        b=hJh3VjNDzn51SHg0FYqM3cqxezUHWsAtDraigfNejobzgTQhLRTz3GUymELPG+v1g/
         2mGrekHuL3xQoDaQs3SYjUo+GAb2E2d96KbAe/AfIIZ+YwYRkC9OdhKqz7TUurTfhfJs
         gaXwYJQubQVxWJwm49im0RJfHBU4n5TmZfe+qo+N+qqS/DwGXvhjr1xWpOBrDAku1m33
         tNo6T4jc03rYt/5ZtaALgXve+BLMV7B8ZmrUaf/fdYEiw1u9phF7BPeDk6k85pZIlThK
         CNByGM7SYS2Nvm8qedBC/69BRO1Xc7jBNA3hOBN75hN7ds3egvEDE4snB/QSJHFiJ9O+
         tlQg==
X-Gm-Message-State: APjAAAVfTsE0R83IHGGyeUOq+njCFYUb4H3vrUuvbL8iwEcTTDpFfSYK
        lmOmhaVtFuKD6fFMz/sd7g==
X-Google-Smtp-Source: APXvYqz69JDID2fJqVQHBsqpbzGdCfYQdFAvvCP76K5lkHq5ZezS4qwxqyj5D6GYBOIopNPx1thdQA==
X-Received: by 2002:a6b:c38b:: with SMTP id t133mr22538567iof.162.1562639646373;
        Mon, 08 Jul 2019 19:34:06 -0700 (PDT)
Received: from localhost ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n7sm14884828ioo.79.2019.07.08.19.34.05
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 19:34:05 -0700 (PDT)
Date:   Mon, 8 Jul 2019 20:34:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 5/6] dt-bindings: timer: renesas: tmu: Document r8a774a1
 bindings
Message-ID: <20190709023404.GA6500@bogus>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560258401-9517-6-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 11 Jun 2019 14:06:40 +0100, Fabrizio Castro wrote:
> Document RZ/G2M (R8A774A1) SoC in the Renesas TMU bindings.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
