Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD3E5A12CC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Aug 2022 15:58:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240212AbiHYN6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Aug 2022 09:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234505AbiHYN6x (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Aug 2022 09:58:53 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E4D99E6B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 06:58:49 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id s8so2067456ljj.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Aug 2022 06:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=BTlM/cFLD+1CkNW/ZxmFzzxJ0bHJWjGuLz6k/+RSnoE=;
        b=ZT/KPG2upbkbFl3GYmUPXQ9LhQ4Wl0ciLlKUKAT+nl5Vc8TvOTF2dP0CRUAkVDNa0S
         OQ3MwzXMS6QHiKl5Ch9iMcUswkIbtyyDWNwj6JTS/pDK7YewdDk25cJNM2mm4IhB6wvF
         HBfRruXHfP6kcAY1GsVpyg7k0/oVrGiTmBd9e2gpJzIWMo9k/d+z/OXDsb7UpeC5mtUE
         huE2KTtCO9A31XR1S3pjOIu7ccwO590loDbfhqB0LbXlBjlUJaBp8VwTTnn+0HAOqKgv
         MBz0Y5HmthYIg6F5CYT1Czc3TbvPu73SoySSAyXQkNdfS13K8FFKf7LTMO5dNBQlps7l
         MAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=BTlM/cFLD+1CkNW/ZxmFzzxJ0bHJWjGuLz6k/+RSnoE=;
        b=IvRuMRfCn0ZeA7xFui/1g0jlBTw2MhXGM/kEiMRnQsKowXiP3cbJYfWIkgoKG1FZu9
         ih4/wuXFxatu6QpD/lBbPq4NCXt5yAq26J/1z1BGMvga7fQiXaV+wph6qSflxkOAqRQF
         6cQ53XO/HwFsYCInQ2DjfRIjNme294nEi/VPtroE0EdlWIAb13PGOYP620qs7W6JBwSd
         2b/YQIWfye/dd1XwC//fKoWD5TpKCP4q/mWwZo4tseS+QPqp3x7A+bXFA8O5HBJj16qV
         8XJT7XXqosAXkYcjuGHe1gRVkQYwfWvbdp3xySvoG2kofpEJRsHewUsA23aJok1lctAF
         fnvA==
X-Gm-Message-State: ACgBeo2SxQ1EI2Iq7Dn1N/1Gx2ONi/Sm16v/3am4+BWseeqocrO3/QY1
        TdjZVyKtf5D1xALT2xcLRQrB+TGatqE/+Vw+
X-Google-Smtp-Source: AA6agR66QlOHRdbYRDfA/bk3bB2fVwl/UWRqczjm3EFBzKwgFc8k97B9US4HVGX/D76CKnFRwR1BHA==
X-Received: by 2002:a2e:98da:0:b0:261:d386:e748 with SMTP id s26-20020a2e98da000000b00261d386e748mr1089731ljj.148.1661435927943;
        Thu, 25 Aug 2022 06:58:47 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id s9-20020ac24649000000b0048b03d1ca4asm511051lfo.161.2022.08.25.06.58.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:58:47 -0700 (PDT)
Message-ID: <d908fd53-1944-6f48-8d8e-4b3f1ec41156@linaro.org>
Date:   Thu, 25 Aug 2022 16:58:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v13 1/5] media: dt-bindings: media: renesas,vsp1: Document
 RZ/G2L VSPD bindings
Content-Language: en-US
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
References: <20220825132144.2619239-1-biju.das.jz@bp.renesas.com>
 <20220825132144.2619239-2-biju.das.jz@bp.renesas.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825132144.2619239-2-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 25/08/2022 16:21, Biju Das wrote:
> Document VSPD found in RZ/G2L SoC. VSPD block is similar to VSP2-D
> found on R-Car SoC's, but it does not have a version register and
> it has 3 clocks compared to 1 clock on vsp1 and vsp2.
> 
> This patch introduces a new compatible 'renesas,r9a07g044-vsp2' to
> handle these differences.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

To avoid any annoying bounces, you can replace it with:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
