Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 798E44F1D44
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 23:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351484AbiDDVai (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 17:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1380270AbiDDT0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 15:26:22 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3809E26AD7;
        Mon,  4 Apr 2022 12:24:26 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-df0940c4eeso11897121fac.8;
        Mon, 04 Apr 2022 12:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ifeIhYfjlW0ULRJDooo6QxPNwMkL7upjn0RvWlwhS08=;
        b=WqsXxI2+zw4X5A7N1ZjMVVq3wctAKjqFr+x1x7MaPX35yIP7EJstPfQnSzmMRIEVKh
         dIlnQM3v8fQ92NvHqMsjWVH538RUMQZ8kBBnQbwbBhrbc/E5X88md4hJmOVwQDMRqsZL
         mdMjucjlBEO3kbr6KThywQJ15p4HgkK8wyLrHlmrXN+4ivJpr5sejlXNt6BHYhkIb1a4
         i3vT/M/DF3bQj+S51BxxzTcApFjBk+USdnbaKlhAHOu+c80HIbxPfWmWIlGc6D4wBOkW
         r5L/POA317J++yn5VVTdXuz/2vlQvuguoeFR9x2kPwZafxt5z5b/aB1hkj3dfuOeKygb
         pzbA==
X-Gm-Message-State: AOAM531KPJ+9dfICD0g6Rk/wXk8BZX/8upLCQLOPtfwXTb1VdGd9khUI
        VWcMgyZREKQGUbCuYFfXAAO5nHA0mw==
X-Google-Smtp-Source: ABdhPJyyEsDRAlCfD0eED8AW8ndC/mu5ruwNAUWUYcjpoI113iNC4TpuLXvJcoJ4qCgfLjhvko8CnA==
X-Received: by 2002:a05:6870:b6a6:b0:dd:999f:6596 with SMTP id cy38-20020a056870b6a600b000dd999f6596mr418543oab.106.1649100265424;
        Mon, 04 Apr 2022 12:24:25 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id d1-20020a056830138100b005cf2f29d89csm4535284otq.77.2022.04.04.12.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 12:24:24 -0700 (PDT)
Received: (nullmailer pid 1805190 invoked by uid 1000);
        Mon, 04 Apr 2022 19:24:24 -0000
Date:   Mon, 4 Apr 2022 14:24:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-renesas-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2 02/13] dt-bindings: serial: renesas,em-uart: Document
 r9a09g011 bindings
Message-ID: <YktF6LTG9+cM7axp@robh.at.kernel.org>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
 <20220330154024.112270-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220330154024.112270-3-phil.edworthy@renesas.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 30 Mar 2022 16:40:13 +0100, Phil Edworthy wrote:
> The Renesas RZ/V2M (r9a09g011) SoC uses a uart that is compatible with the
> EMMA Mobile SoC.
> 
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2: Fix dtbs_check by adding missing alternative binding
> ---
>  .../devicetree/bindings/serial/renesas,em-uart.yaml      | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
