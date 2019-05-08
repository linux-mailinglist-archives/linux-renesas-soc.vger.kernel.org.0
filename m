Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C69917E85
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 18:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728776AbfEHQwX (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 12:52:23 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:36965 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbfEHQwX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 12:52:23 -0400
Received: by mail-lf1-f68.google.com with SMTP id h126so3889737lfh.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 May 2019 09:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=tSbV0hIT6zSzNhIts7V7OvvP5JqoQNMoPHnS6WoTwu8=;
        b=oyj3rsutc76/lKGTt04GMx8W276cXzfR4dx7Xe1ihD7rjDst4YU83+FjRiHbFMisRI
         OLnkQLOrHuZwkJMJLH9CpYWpp4c8MsAQOzNolxjSPFLQddH9DdCyEGgd8olUv0ySASMm
         psqUqlH+41hNneHpw8Y7l+7uqrKPjjjDvgQ/zgcdRf0kzbW9YhlWvQ9ecvHULhVkhFR2
         AEGLfDOvOu25qALM7Szhv5EfIjOKIcFGQCVmt9ZHaZiuaN+eBZUCGTKJQ/SxTR3bIKNe
         T0R0ee28KJmEOP1BY/ySW+8KsW6Nv56UguES7n2e9a+VNDt+i7vgO8gywO02d0WfATR7
         Obzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=tSbV0hIT6zSzNhIts7V7OvvP5JqoQNMoPHnS6WoTwu8=;
        b=gRILnIZokdW/URJBgW75m9DZwu0Nkn1Tf32+jXBZKRUiFRESuwirvpNUVZtufZrQl2
         fq2pAFDfoVvypFijKAp4ypYt96ZyymMG0UCUZkh4z0tDaChwtc7sC3r/2QDHjgjmxwBh
         kL5hB5W4hK/E6U/aApuyrzUD13/KndkyisOP0hnh/97c5qt7ZJhbBB92p3sKSSZBlLL+
         m8Ut7HoIOFzwEHoBRlpCwIQX1/laD5dzZIuVKP8YbfuLz4XsSdOVNvw4Y65IrgfThIK6
         /JutMfOz9fifOLQiOq5kX445KjlRGVjaM+vb9dGkVG1KJmL/rKG2jSeCzuFwpGtEbY8K
         kN0w==
X-Gm-Message-State: APjAAAXsmZpL9Gu/AVKdmVxznOzeJT8+s8XPvD3Zzy5SAQ8c44+yp70d
        2AdByYX1Pg0Y/LOJXzg3WMXXKQ==
X-Google-Smtp-Source: APXvYqyZ2r82pYlOtlxeZg0hA3XRugj4mYMr3E0JZJxVbFgxTXFUahuO3LZtq184KFLdKIxu7DBYOA==
X-Received: by 2002:ac2:490c:: with SMTP id n12mr9072188lfi.4.1557334341234;
        Wed, 08 May 2019 09:52:21 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id p87sm3725885ljp.82.2019.05.08.09.52.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 May 2019 09:52:20 -0700 (PDT)
Date:   Wed, 8 May 2019 18:52:20 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, wsa@the-dreams.de, horms@verge.net.au,
        magnus.damm@gmail.com
Subject: Re: [PATCH] ravb: implement MTU change while device is up
Message-ID: <20190508165219.GA26309@bigcity.dyn.berto.se>
References: <1557328882-24307-1-git-send-email-uli+renesas@fpond.eu>
 <1f7be29e-c85a-d63d-c83f-357a76e8ca45@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1f7be29e-c85a-d63d-c83f-357a76e8ca45@cogentembedded.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sergei,

On 2019-05-08 18:59:01 +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 05/08/2019 06:21 PM, Ulrich Hecht wrote:
> 
> > Uses the same method as various other drivers: shut the device down,
> > change the MTU, then bring it back up again.
> > 
> > Tested on Renesas D3 Draak board.
> > 
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
>    You should have CC'ed me (as an reviewer for the Renesas drivers).
> 
> > ---
> >  drivers/net/ethernet/renesas/ravb_main.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> 
>    What about sh_eth?
> 
> > 
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index ef8f089..02c247c 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -1810,13 +1810,16 @@ static int ravb_do_ioctl(struct net_device *ndev, struct ifreq *req, int cmd)
> >  
> >  static int ravb_change_mtu(struct net_device *ndev, int new_mtu)
> >  {
> > -	if (netif_running(ndev))
> > -		return -EBUSY;
> > +	if (!netif_running(ndev)) {
> > +		ndev->mtu = new_mtu;
> > +		netdev_update_features(ndev);
> > +		return 0;
> > +	}
> >  
> > +	ravb_close(ndev);
> >  	ndev->mtu = new_mtu;
> > -	netdev_update_features(ndev);
> >  
> > -	return 0;
> > +	return ravb_open(ndev);
> 
>    How about the code below instead?
> 
> 	if (netif_running(ndev))
> 		ravb_close(ndev);
> 
>  	ndev->mtu = new_mtu;
> 	netdev_update_features(ndev);

Is there a need to call netdev_update_features() even if the if is not 
running?

> 
> 	if (netif_running(ndev))
> 		return ravb_open(ndev);
> 
> 	return 0;
> 
> [...]
> 
> MBR, Sergei

-- 
Regards,
Niklas Söderlund
