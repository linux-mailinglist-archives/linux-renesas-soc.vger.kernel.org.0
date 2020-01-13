Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 24C97139C98
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jan 2020 23:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729188AbgAMWc6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Jan 2020 17:32:58 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45093 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729159AbgAMWct (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Jan 2020 17:32:49 -0500
Received: by mail-oi1-f193.google.com with SMTP id n16so9908247oie.12
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jan 2020 14:32:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8OSe8nCMD8zFTJxmKCShhLga5sECo0uXyDP7h9INGG4=;
        b=B14LhVfGTEoOqOK9oREHRBjY/CtgEl5Zt2NEwW4bH9TS9v/NvNUHlm6P+VRsNERQlz
         YuCleIiC0M65jiidVyiCJzNs9wnXinjOlg6UxBXZg8vxdsaWic92rRHlGKUT8TxxkkJo
         Cxu2bE3e3oJCAYwKEWOea76UtHfU+OA1Nf7oH1qdqsVq35QqEmDJ+vDfLM6LnxuxN4TT
         NAGvPQ4oeR669oKzTOuOT1OIYcyLKu2SJUF6WBas5PJ3vm1t/OyimF8yQhx9+CT9snGt
         1+1RH+uZVkjXMvqV40h34hLJJ0jJ5s+a9/7df1z5kvSdY6QfqwqaT3vlMph+r6iNySGb
         yyAg==
X-Gm-Message-State: APjAAAVInSBFjU7UlQJm0bRzkNfFAM5+z1cWr8j7dJ/wfmNi89rGMToe
        ca7Y/+XxDgUyMRmsgsRu+oPvuY0=
X-Google-Smtp-Source: APXvYqyfI6Z9zP8RxsERRV+WlwR/VCSAj7gQninYLFrhagcAwX3FvFJW3hsxsTILHpRiwwFt3zNIUQ==
X-Received: by 2002:a54:4396:: with SMTP id u22mr14809569oiv.128.1578954768803;
        Mon, 13 Jan 2020 14:32:48 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s128sm3972493oia.4.2020.01.13.14.32.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 14:32:47 -0800 (PST)
Received: from rob (uid 1000)
        (envelope-from rob@rob-hp-laptop)
        id 2219d1
        by rob-hp-laptop (DragonFly Mail Agent v0.11);
        Mon, 13 Jan 2020 16:32:46 -0600
Date:   Mon, 13 Jan 2020 16:32:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alex Riesen <alexander.riesen@cetitec.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/8] dt-bindings: adv748x: add information about serial
 audio  interface (I2S/TDM)
Message-ID: <20200113223246.GA22019@bogus>
References: <cover.1578924232.git.alexander.riesen@cetitec.com>
 <20200113141550.GH3606@pflmari>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200113141550.GH3606@pflmari>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 13 Jan 2020 15:15:50 +0100, Alex Riesen wrote:
> As the driver has some support for the audio interface of the device,
> the bindings file should mention it.
> 
> Signed-off-by: Alexander Riesen <alexander.riesen@cetitec.com>
> ---
>  .../devicetree/bindings/media/i2c/adv748x.txt       | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
