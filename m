Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 751427970F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jul 2019 21:57:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403922AbfG2T5m (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jul 2019 15:57:42 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:41132 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389940AbfG2T5m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jul 2019 15:57:42 -0400
Received: by mail-lf1-f68.google.com with SMTP id 62so38054740lfa.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jul 2019 12:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=qNbOegTnTfayiKcGg2WPsEFWEJS+NAOGdKiUhPuxefk=;
        b=TpKbImQL3QsLrm9f2kKfxBdgxpNzzpcXN7l3h4eFrWM0p7B84ZP+e0MsrP3S9MLJ0l
         5cHS4PayFSuRfyQ2trsIBNdAStMrUNV8KdgTo1aZA7rzQGVLyk6G63GEnZW+bBs2lehq
         MravcXryFPHowqRXbsEfxaD7n0PISko1Mkes1vx0Yu0PFEugvij2k1gUD47mdrqoG1XJ
         aSZvaPlplUfXj17Jahwb8eO+7JGyroV0fDXuf7vSgC8U4KloseOfJKmt8RuyN48S3nme
         6PBBlDcpN48zWrHONKmSVZ/hO426JRrfaUbFwfRPZtcLZGD9kyTUtktCS1GxpebLaK2j
         ZfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=qNbOegTnTfayiKcGg2WPsEFWEJS+NAOGdKiUhPuxefk=;
        b=Q9yjlqTPVFft0h+J0FhYOp/ew5EFchzYeJyRHl0dEu9SK903LQ9OJkNDOs4uKsyUtQ
         WivQ34/by1iIjKI707pYHp5vNwN34L70pYPyqjYyT3zNpCxogFVkxQGtBQeE8fsv32o3
         D/ovzN+ZsRw0/YeNHiTf2uJ2k2GFPNoiOnLLaTTmIPB+eU6cQtRdW15vZWJmb8V5kc5Q
         RufFPWi0XSEn1Jw4X7Q7FRnziv7lNScssx1G0GhTQNBcoQ6tjS5cnC0B9CZl8xoEYtAq
         CIHT7BrdyXRg/4aamYJ1SbetpmihjhL78CNqoH0QNj8cVFjklyxH9zr8D69mPAiKIqRn
         3WnA==
X-Gm-Message-State: APjAAAUFoGrt11X0a/QKFku0Kx2v0bPomgcr9JxwWu6nIPDVCySaLbgP
        h6kK+G+t6Y43WVua3x/g3Rw=
X-Google-Smtp-Source: APXvYqxlJa7CFJs8wuZDag31XZADiKvucyJRJ+S5YoBd5J08pw4zNER8GB4MkH9sMcFyTnF2Vmnmlw==
X-Received: by 2002:a19:4f42:: with SMTP id a2mr12714911lfk.23.1564430259982;
        Mon, 29 Jul 2019 12:57:39 -0700 (PDT)
Received: from localhost (customer-145-14-112-32.stosn.net. [145.14.112.32])
        by smtp.gmail.com with ESMTPSA id v17sm14578546ljg.36.2019.07.29.12.57.39
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 29 Jul 2019 12:57:39 -0700 (PDT)
Date:   Mon, 29 Jul 2019 21:57:38 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rcar-imr: Rename bindings documentation file
Message-ID: <20190729195738.GH3186@bigcity.dyn.berto.se>
References: <20190729074757.9581-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190729074757.9581-1-horms+renesas@verge.net.au>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

Thanks for your work.

On 2019-07-29 09:47:57 +0200, Simon Horman wrote:
> Renesas media binding documentation files uses a naming schema of
> 'renesas,<module>.txt'. Rename IMR file to match this pattern.
> 
> Cc: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename Documentation/devicetree/bindings/media/{rcar_imr.txt => renesas,imr.txt} (100%)
> 
> diff --git a/Documentation/devicetree/bindings/media/rcar_imr.txt b/Documentation/devicetree/bindings/media/renesas,imr.txt
> similarity index 100%
> rename from Documentation/devicetree/bindings/media/rcar_imr.txt
> rename to Documentation/devicetree/bindings/media/renesas,imr.txt
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas S�derlund
