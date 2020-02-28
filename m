Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA39173BFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 16:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727350AbgB1Pno (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 10:43:44 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:37110 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726974AbgB1Pno (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 10:43:44 -0500
Received: by mail-ot1-f65.google.com with SMTP id b3so2972434otp.4;
        Fri, 28 Feb 2020 07:43:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=NzRocj0ncokvHG18Rq/CmxEUE1Zj03t15w4ZGiHk6WI=;
        b=UTMv93WPAfeK+5aEH28DhG0oz+dbvehE+0SLYHiyLdF9GhnfoaA1fi3pTXQkYcUTEY
         ZBh7O315aAPBMzYgvCn+YrD6w4TF6vgS5QkRQJOekCh1S2u2GXvrQvf5Y3NZX0FneSAp
         Is+iTjvWV20upnOUdEWH7EdZ3unM7HKHZSWIMG7cNqljDpB0874ugdOYqNWsfB6PfUN6
         zwa6GP0dNYAp1jGnqzfp56WEdhymR9eDfop0aCI0rmJW6yQVnbcAW3mJkN/Bq/zZ/pPV
         tSi2fIeY6OwN8jK4xBkOWdavHklLkCKXatkuk8bUnk9kfXNKo7EFspBpoyRzb5Y7TGwB
         DNZA==
X-Gm-Message-State: APjAAAVXujhRRf7/WJGkn2DHpgk3g44otjiT2YMyXfdtsOVbkB3YGgW1
        priIJNtfjTibrqvDk0ciWQ==
X-Google-Smtp-Source: APXvYqwAvfS4y3PeT6erebn9BS5cNwBYC4dNvyGCySQ0gBTJqJTBvkVDLPQ7c1l+dui+RdfYxvqeig==
X-Received: by 2002:a05:6830:1184:: with SMTP id u4mr3627386otq.221.1582904623350;
        Fri, 28 Feb 2020 07:43:43 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id a26sm1576281oid.17.2020.02.28.07.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 07:43:42 -0800 (PST)
Received: (nullmailer pid 18141 invoked by uid 1000);
        Fri, 28 Feb 2020 15:43:42 -0000
Date:   Fri, 28 Feb 2020 09:43:42 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH v2] dt-bindings: power: rcar-sysc: Convert to json-schema
Message-ID: <20200228154342.GA18088@bogus>
References: <20200224135234.32049-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200224135234.32049-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 24 Feb 2020 14:52:34 +0100, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car System Controller Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> v2:
>   - Add Reviewed-by,
>   - Drop "DT bindings for the" from title.
> ---
>  .../bindings/power/renesas,rcar-sysc.txt      | 62 ----------------
>  .../bindings/power/renesas,rcar-sysc.yaml     | 73 +++++++++++++++++++
>  2 files changed, 73 insertions(+), 62 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.txt
>  create mode 100644 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
> 

Applied, thanks.

Rob
